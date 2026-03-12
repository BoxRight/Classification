#!/usr/bin/env python3
"""
Batch IR Generation via Anthropic Agent

Walks through every .txt file in downloads/, sends each to the Anthropic API
with the IR extraction spec, and saves one IR JSON per .txt file.
"""

import os
import re
import json
import sys
import argparse
from pathlib import Path

# Project root
PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

# Load API keys from .env
def load_env() -> tuple[str | None, str | None]:
    """Return (anthropic_key, openrouter_key)."""
    try:
        from dotenv import load_dotenv
        load_dotenv(PROJECT_ROOT / ".env")
    except ImportError:
        env_path = PROJECT_ROOT / ".env"
        if env_path.exists():
            with open(env_path, "r") as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith("#") and "=" in line:
                        key, _, val = line.partition("=")
                        key = key.strip()
                        val = val.strip().strip('"').strip("'")
                        if key == "ANTHROPIC_API_KEY":
                            os.environ[key] = val
                        elif key == "OPENROUTER_API_KEY":
                            os.environ[key] = val
    return os.environ.get("ANTHROPIC_API_KEY"), os.environ.get("OPENROUTER_API_KEY")


def get_spec_prompt() -> str:
    """Load the IR agent spec from config."""
    spec_path = PROJECT_ROOT / "config" / "ir_agent_spec.md"
    if not spec_path.exists():
        raise FileNotFoundError(f"IR spec not found: {spec_path}")
    return spec_path.read_text(encoding="utf-8")


def extract_json_from_response(text: str) -> dict:
    """Extract JSON from API response, handling markdown code blocks."""
    text = text.strip()
    # Remove markdown code block if present
    if "```json" in text:
        match = re.search(r"```json\s*([\s\S]*?)```", text)
        if match:
            text = match.group(1).strip()
    elif "```" in text:
        match = re.search(r"```\s*([\s\S]*?)```", text)
        if match:
            text = match.group(1).strip()
    return json.loads(text)


def generate_ir_anthropic(
    text: str,
    spec: str,
    client,
    model: str,
    validation_errors: str | None = None,
) -> dict:
    """Call Anthropic API to generate IR."""
    user_content = f"Extract the Legal IR from the following document:\n\n{text}"
    if validation_errors:
        user_content += f"\n\n---\nYour previous output failed validation. Fix these errors and return valid JSON only:\n{validation_errors}"

    response = client.messages.create(
        model=model,
        max_tokens=8192,
        system=spec,
        messages=[{"role": "user", "content": user_content}],
    )
    content = response.content[0]
    if content.type != "text":
        raise ValueError(f"Unexpected response type: {content.type}")
    return extract_json_from_response(content.text)


def generate_ir_openrouter(
    text: str,
    spec: str,
    client,
    model: str,
    validation_errors: str | None = None,
) -> dict:
    """Call OpenRouter API (OpenAI-compatible) to generate IR."""
    user_content = f"Extract the Legal IR from the following document:\n\n{text}"
    if validation_errors:
        user_content += f"\n\n---\nYour previous output failed validation. Fix these errors and return valid JSON only:\n{validation_errors}"

    response = client.chat.completions.create(
        model=model,
        max_tokens=8192,
        messages=[
            {"role": "system", "content": spec},
            {"role": "user", "content": user_content},
        ],
    )
    content = response.choices[0].message.content
    if not content:
        raise ValueError("Empty response from OpenRouter")
    return extract_json_from_response(content)


def generate_ir_for_document(
    text: str,
    spec: str,
    agent_client,
    model: str,
    validation_errors: str | None = None,
    use_openrouter: bool = False,
) -> dict:
    """Call API to generate IR for a single document."""
    if use_openrouter:
        return generate_ir_openrouter(text, spec, agent_client, model, validation_errors)
    return generate_ir_anthropic(text, spec, agent_client, model, validation_errors)


def find_txt_files(root: Path) -> list[Path]:
    """Find all .txt files under root."""
    return sorted(root.rglob("*.txt"))


def segment_clauses(text: str) -> list[str]:
    """
    Simple clause segmentation: split on blank lines and on lines matching
    numbered sections (1., 2.) or headings (CLÁUSULA, Artículo).
    Returns a JSON-serializable list of clause strings.
    """
    clauses = []
    current = []
    split_pattern = re.compile(r"^(\d+\.|CLÁUSULA|Artículo)\s", re.IGNORECASE)

    for line in text.split("\n"):
        stripped = line.strip()
        if not stripped:
            if current:
                clauses.append("\n".join(current))
                current = []
        elif split_pattern.match(stripped) and current:
            clauses.append("\n".join(current))
            current = [stripped]
        else:
            current.append(stripped)

    if current:
        clauses.append("\n".join(current))
    return clauses


def main():
    parser = argparse.ArgumentParser(description="Batch IR generation via Anthropic agent")
    parser.add_argument(
        "--downloads",
        default=str(PROJECT_ROOT / "downloads"),
        help="Root directory containing .txt files",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="List files without processing",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Limit number of files to process (for testing)",
    )
    parser.add_argument(
        "--skip",
        type=int,
        default=0,
        help="Skip first N files (resume from file N+1)",
    )
    parser.add_argument(
        "--file",
        type=str,
        default=None,
        help="Process only this .txt file (path relative to downloads or absolute)",
    )
    parser.add_argument(
        "--model",
        default=None,
        help="Model to use (default: claude-sonnet-4-20250514 for Anthropic, anthropic/claude-sonnet-4 for OpenRouter)",
    )
    parser.add_argument(
        "--openrouter",
        action="store_true",
        help="Use OpenRouter API (requires OPENROUTER_API_KEY in .env)",
    )
    parser.add_argument(
        "--retry-on-invalid",
        action="store_true",
        help="Retry once with validation errors when output fails schema validation",
    )
    parser.add_argument(
        "--no-validate",
        action="store_true",
        help="Skip Pydantic validation (save raw output)",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        help="Duplicate artifacts to debug/<doc_id>/ for inspection (read-only)",
    )
    args = parser.parse_args()

    downloads_path = Path(args.downloads).resolve()
    if not downloads_path.exists():
        print(f"Error: Directory not found: {downloads_path}")
        return 1

    txt_files = find_txt_files(downloads_path)
    if not txt_files:
        print(f"No .txt files found under {downloads_path}")
        return 0

    if args.file:
        arg_path = Path(args.file)
        file_path = (downloads_path / arg_path) if not arg_path.is_absolute() else arg_path
        file_path = file_path.resolve()
        if not file_path.exists():
            print(f"Error: File not found: {file_path}", file=sys.stderr)
            return 1
        files_to_process = [file_path]
        print(f"Processing single file: {file_path.relative_to(downloads_path)}")
    else:
        files_to_process = txt_files[args.skip:]
        if args.limit:
            files_to_process = files_to_process[: args.limit]

    if args.dry_run:
        print(f"Would process {len(files_to_process)} files:")
        for p in files_to_process[:20]:
            print(f"  {p.relative_to(downloads_path)}")
        if len(files_to_process) > 20:
            print(f"  ... and {len(files_to_process) - 20} more")
        return 0

    anthropic_key, openrouter_key = load_env()
    use_openrouter = args.openrouter

    if use_openrouter:
        if not openrouter_key:
            print("Error: OPENROUTER_API_KEY not found in .env or environment")
            return 1
        try:
            from openai import OpenAI
            client = OpenAI(
                api_key=openrouter_key,
                base_url="https://openrouter.ai/api/v1",
            )
        except ImportError:
            print("Error: openai package required for OpenRouter. Run: pip install openai python-dotenv")
            return 1
        model = args.model or "anthropic/claude-sonnet-4"
    else:
        if not anthropic_key:
            print("Error: ANTHROPIC_API_KEY not found in .env or environment")
            return 1
        try:
            import anthropic
            client = anthropic.Anthropic(api_key=anthropic_key)
        except ImportError:
            print("Error: anthropic package required. Run: pip install anthropic python-dotenv")
            return 1
        model = args.model or "claude-sonnet-4-20250514"

    spec = get_spec_prompt()

    try:
        from src.ir.agent_models import validate_ir, ir_to_dict
    except ImportError as e:
        if args.no_validate:
            validate_ir = None
            ir_to_dict = lambda x: x  # noqa: E731
        else:
            print(f"Error: {e}. Install pydantic or use --no-validate")
            return 1

    print(f"Processing {len(files_to_process)} .txt files...")

    ok = 0
    fail = 0

    for i, txt_path in enumerate(files_to_process, 1):
        rel = txt_path.relative_to(downloads_path)
        out_path = txt_path.parent / f"{txt_path.stem}_ir.json"

        try:
            text = txt_path.read_text(encoding="utf-8")
        except Exception as e:
            print(f"  [{i}/{len(files_to_process)}] SKIP {rel}: read error: {e}")
            fail += 1
            continue

        try:
            ir_raw = generate_ir_for_document(
                text, spec, client, model=model,
                validation_errors=None,
                use_openrouter=use_openrouter,
            )
            source_meta = {"file": str(rel), "path": str(txt_path)}

            if validate_ir is not None and not args.no_validate:
                try:
                    validated = validate_ir(ir_raw)
                    ir = ir_to_dict(validated)
                except Exception as ve:
                    if args.retry_on_invalid:
                        err_msg = str(ve)
                        ir_raw = generate_ir_for_document(
                            text, spec, client, model=model,
                            validation_errors=err_msg,
                            use_openrouter=use_openrouter,
                        )
                        try:
                            validated = validate_ir(ir_raw)
                            ir = ir_to_dict(validated)
                        except Exception as ve2:
                            print(f"  [{i}/{len(files_to_process)}] FAIL {rel}: validation retry failed: {ve2}")
                            fail += 1
                            continue
                    else:
                        print(f"  [{i}/{len(files_to_process)}] FAIL {rel}: validation: {ve}")
                        fail += 1
                        continue
            else:
                ir = ir_raw

            ir["_source"] = source_meta
            out_path.write_text(json.dumps(ir, indent=2, ensure_ascii=False), encoding="utf-8")
            if args.debug:
                doc_id = txt_path.stem
                debug_dir = PROJECT_ROOT / "debug" / doc_id
                debug_dir.mkdir(parents=True, exist_ok=True)
                (debug_dir / "raw_ir.json").write_text(
                    json.dumps(ir, indent=2, ensure_ascii=False), encoding="utf-8"
                )
                clauses = segment_clauses(text)
                (debug_dir / "clauses.json").write_text(
                    json.dumps(clauses, indent=2, ensure_ascii=False), encoding="utf-8"
                )
            print(f"  [{i}/{len(files_to_process)}] OK {rel} -> {out_path.name}")
            ok += 1
        except Exception as e:
            print(f"  [{i}/{len(files_to_process)}] FAIL {rel}: {e}")
            fail += 1

    print(f"\nDone: {ok} succeeded, {fail} failed")
    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
