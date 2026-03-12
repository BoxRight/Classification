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
        "--no-validate",
        action="store_true",
        help="Skip mandatory parse validation",
    )
    parser.add_argument(
        "--file",
        type=str,
        default=None,
        help="Process only this _ir.json file (path relative to downloads or absolute)",
    )
    parser.add_argument(
        "--debug",
        action="store_true",
        help="Duplicate artifacts to debug/<doc_id>/ for inspection (read-only)",
    )
    parser.add_argument(
        "--path",
        type=str,
        default=None,
        help="Only process files under this subpath (e.g. Contratos, Contratos/Arrendamiento)",
    )
    parser.add_argument(
        "--report",
        type=str,
        default=None,
        metavar="FILE",
        help="Write JSON report of results to FILE (success/fail per file)",
    )
    args = parser.parse_args()

    downloads_path = Path(args.downloads).resolve()
    output_path = Path(args.output).resolve()

    if not downloads_path.exists():
        print(f"Error: {downloads_path} not found", file=sys.stderr)
        return 1

    ir_files = sorted(downloads_path.rglob("*_ir.json"))
    if args.path:
        prefix = Path(args.path).as_posix().strip("/")
        if prefix:
            ir_files = [p for p in ir_files if p.relative_to(downloads_path).as_posix().startswith(prefix)]
        print(f"Filtered to {len(ir_files)} files under {args.path}")
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
    report_rows = [] if args.report else None

    for i, ir_path in enumerate(ir_files, 1):
        rel = ir_path.relative_to(downloads_path)
        # TMX_xxx_es_ir.json -> TMX_xxx_es.dsl
        dsl_name = rel.name.replace("_ir.json", ".dsl")
        dsl_rel = rel.parent / dsl_name
        out_path = output_path / dsl_rel

        try:
            ir = json.loads(ir_path.read_text(encoding="utf-8"))
            ir_sanitized = sanitize_ir(ir)
            dsl = render_ir(ir_sanitized)
            out_path.parent.mkdir(parents=True, exist_ok=True)
            out_path.write_text(dsl, encoding="utf-8")
            if args.debug:
                doc_id = rel.stem.replace("_ir", "")
                debug_dir = PROJECT_ROOT / "debug" / doc_id
                debug_dir.mkdir(parents=True, exist_ok=True)
                (debug_dir / "sanitized_ir.json").write_text(
                    json.dumps(ir_sanitized, indent=2, ensure_ascii=False), encoding="utf-8"
                )
                (debug_dir / "output.dsl").write_text(dsl, encoding="utf-8")
            print(f"  [{i}/{len(ir_files)}] OK {rel} -> {dsl_rel}")
            ok += 1
            if report_rows is not None:
                report_rows.append({"file": str(rel), "status": "ok", "dsl": str(dsl_rel)})
        except Exception as e:
            print(f"  [{i}/{len(ir_files)}] FAIL {rel}: {e}", file=sys.stderr)
            fail += 1
            if report_rows is not None:
                report_rows.append({"file": str(rel), "status": "fail", "error": str(e)})

    print(f"\nDone: {ok} succeeded, {fail} failed")
    if args.report and report_rows:
        report_path = Path(args.report).resolve()
        report_path.parent.mkdir(parents=True, exist_ok=True)
        report_data = {
            "summary": {"ok": ok, "fail": fail, "total": len(ir_files)},
            "results": report_rows,
        }
        report_path.write_text(json.dumps(report_data, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"Report: {report_path}")
    print(f"DSL dataset: {output_path}")

    # Mandatory validation: run after conversion unless --no-validate; use Haskell parser when PARSER_CMD set
    if not args.no_validate and fail == 0 and ok > 0:
        import subprocess
        validate_script = PROJECT_ROOT / "scripts" / "validate_dsl.py"
        result = subprocess.run(
            ["python3", str(validate_script), "--dsl-dir", str(output_path)],
            cwd=PROJECT_ROOT,
        )
        if result.returncode != 0:
            return result.returncode

    return 0 if fail == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
