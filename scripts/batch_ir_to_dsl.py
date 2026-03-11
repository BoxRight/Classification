#!/usr/bin/env python3
"""
Batch IR → DSL: Process all *_ir.json files and generate DSL dataset.

Preserves directory structure from downloads/ to dsl/dataset/.
"""

import json
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.dsl.renderer import render_ir
from src.dsl.sanitizer import sanitize_ir


def main():
    import argparse
    parser = argparse.ArgumentParser(description="Batch IR to DSL conversion")
    parser.add_argument(
        "--downloads",
        default=str(PROJECT_ROOT / "downloads"),
        help="Root directory with *_ir.json files",
    )
    parser.add_argument(
        "--output",
        default=str(PROJECT_ROOT / "dsl" / "dataset"),
        help="Output directory for DSL files",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Limit number of files to process",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="List files without processing",
    )
    parser.add_argument(
        "--validate",
        action="store_true",
        help="Run basic validation on generated DSL after conversion",
    )
    parser.add_argument(
        "--file",
        type=str,
        default=None,
        help="Process only this _ir.json file (path relative to downloads or absolute)",
    )
    args = parser.parse_args()

    downloads_path = Path(args.downloads).resolve()
    output_path = Path(args.output).resolve()

    if not downloads_path.exists():
        print(f"Error: {downloads_path} not found", file=sys.stderr)
        return 1

    ir_files = sorted(downloads_path.rglob("*_ir.json"))
    if args.file:
        arg_path = Path(args.file)
        file_path = (downloads_path / arg_path) if not arg_path.is_absolute() else arg_path
        file_path = file_path.resolve()
        if not file_path.exists():
            print(f"Error: File not found: {file_path}", file=sys.stderr)
            return 1
        ir_files = [file_path]
        print(f"Processing single file: {file_path.relative_to(downloads_path)}")
    elif args.limit:
        ir_files = ir_files[: args.limit]

    if args.dry_run:
        print(f"Would process {len(ir_files)} files")
        for p in ir_files[:10]:
            print(f"  {p.relative_to(downloads_path)}")
        if len(ir_files) > 10:
            print(f"  ... and {len(ir_files) - 10} more")
        return 0

    output_path.mkdir(parents=True, exist_ok=True)
    ok = 0
    fail = 0

    for i, ir_path in enumerate(ir_files, 1):
        rel = ir_path.relative_to(downloads_path)
        # TMX_xxx_es_ir.json -> TMX_xxx_es.dsl
        dsl_name = rel.name.replace("_ir.json", ".dsl")
        dsl_rel = rel.parent / dsl_name
        out_path = output_path / dsl_rel

        try:
            ir = json.loads(ir_path.read_text(encoding="utf-8"))
            ir = sanitize_ir(ir)
            dsl = render_ir(ir)
            out_path.parent.mkdir(parents=True, exist_ok=True)
            out_path.write_text(dsl, encoding="utf-8")
            print(f"  [{i}/{len(ir_files)}] OK {rel} -> {dsl_rel}")
            ok += 1
        except Exception as e:
            print(f"  [{i}/{len(ir_files)}] FAIL {rel}: {e}", file=sys.stderr)
            fail += 1

    print(f"\nDone: {ok} succeeded, {fail} failed")
    print(f"DSL dataset: {output_path}")

    if args.validate and fail == 0:
        import subprocess
        validate_script = PROJECT_ROOT / "scripts" / "validate_dsl.py"
        result = subprocess.run(
            ["python3", str(validate_script), "--dsl-dir", str(output_path), "--basic-only"],
            cwd=PROJECT_ROOT,
        )
        return result.returncode

    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
