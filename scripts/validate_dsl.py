#!/usr/bin/env python3
"""
Validate generated DSL files against the Haskell parser.

Mandatory validation: when PARSER_CMD is set, runs full parse validation.
Pipeline must fail if parse errors occur.

Usage:
  python scripts/validate_dsl.py [--dsl-dir PATH] [--parser-cmd CMD] [--limit N]

If PARSER_CMD env var or --parser-cmd is set, runs that command on each DSL file.
Example: PARSER_CMD="stack run -- parse-dsl" or "cabal run compiler -- parse-dsl"

When no parser is available, performs basic structural checks (law, authority, vocabulary, article).
Returns non-zero exit code on any validation failure.
"""

import argparse
import subprocess
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent


def _basic_structural_check(dsl_path: Path) -> tuple[bool, str]:
    """Basic check: file has law, authority, and at least one content section."""
    try:
        text = dsl_path.read_text(encoding="utf-8")
    except Exception as e:
        return False, str(e)
    lines = [l.strip() for l in text.splitlines() if l.strip()]
    has_law = any(l.startswith("law ") for l in lines)
    has_authority = any(l.startswith("authority ") for l in lines)
    has_content = (
        "vocabulary" in lines
        or "parties" in lines
        or "objects" in lines
        or any(l.startswith("article ") for l in lines)
    )
    if not has_law:
        return False, "missing 'law' header"
    if not has_authority:
        return False, "missing 'authority' header"
    if not has_content:
        return False, "missing content (vocabulary, parties, objects, or article)"
    return True, "OK"


def validate_with_parser(dsl_path: Path, parser_cmd: str) -> tuple[bool, str]:
    """Run Haskell parser on DSL file. parser_cmd receives file path as last arg."""
    cmd_parts = parser_cmd.strip().split()
    cmd = cmd_parts + [str(dsl_path)]
    try:
        result = subprocess.run(
            cmd,
            capture_output=True,
            text=True,
            timeout=30,
            cwd=PROJECT_ROOT,
        )
        if result.returncode == 0:
            return True, "OK"
        return False, result.stderr or result.stdout or f"exit code {result.returncode}"
    except subprocess.TimeoutExpired:
        return False, "parser timeout"
    except FileNotFoundError:
        return False, f"parser command not found: {cmd_parts[0]}"
    except Exception as e:
        return False, str(e)


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Validate DSL files (basic structure or Haskell parser)"
    )
    parser.add_argument(
        "--dsl-dir",
        default=str(PROJECT_ROOT / "dsl" / "dataset"),
        help="Directory containing DSL files",
    )
    parser.add_argument(
        "--parser-cmd",
        default=None,
        help="Command to run parser (e.g. 'stack run -- parse-dsl'). Uses PARSER_CMD env if not set.",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Limit number of files to validate",
    )
    parser.add_argument(
        "--basic-only",
        action="store_true",
        help="Only run basic structural checks (no Haskell parser)",
    )
    args = parser.parse_args()

    dsl_dir = Path(args.dsl_dir)
    if not dsl_dir.exists():
        print(f"Error: {dsl_dir} not found", file=sys.stderr)
        return 1

    dsl_files = sorted(dsl_dir.rglob("*.dsl"))
    if args.limit:
        dsl_files = dsl_files[: args.limit]

    parser_cmd = args.parser_cmd or (args.basic_only and None) or __import__("os").environ.get("PARSER_CMD")
    use_parser = parser_cmd and not args.basic_only

    if use_parser:
        print(f"Validating with parser: {parser_cmd}")
    else:
        print("Validating with basic structural checks (set PARSER_CMD for full parse)")

    ok = 0
    fail = 0
    errors = []

    for dsl_path in dsl_files:
        rel = dsl_path.relative_to(dsl_dir)
        if use_parser:
            valid, msg = validate_with_parser(dsl_path, parser_cmd)
        else:
            valid, msg = _basic_structural_check(dsl_path)
        if valid:
            ok += 1
        else:
            fail += 1
            errors.append((rel, msg))

    print(f"\nDone: {ok} OK, {fail} failed")
    if errors:
        for rel, msg in errors[:20]:
            print(f"  FAIL {rel}: {msg}", file=sys.stderr)
        if len(errors) > 20:
            print(f"  ... and {len(errors) - 20} more", file=sys.stderr)

    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
