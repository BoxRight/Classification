#!/usr/bin/env python3
"""
Full pipeline: normalize → extract_ir → render_dsl.

Orchestrates all five stages.
"""

import argparse
import subprocess
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent


def main():
    parser = argparse.ArgumentParser(description="Run full IR-to-DSL pipeline")
    parser.add_argument("input", help="Path to source text file")
    parser.add_argument("-o", "--output-dir", default=None, help="Output directory (default: ir/generated_ir, dsl/generated_dsl)")
    args = parser.parse_args()

    input_path = Path(args.input).resolve()
    if not input_path.exists():
        print(f"Error: {input_path} not found", file=sys.stderr)
        return 1

    stem = input_path.stem
    ir_dir = PROJECT_ROOT / "ir" / "generated_ir"
    dsl_dir = PROJECT_ROOT / "dsl" / "generated_dsl"
    if args.output_dir:
        out = Path(args.output_dir).resolve()
        ir_dir = out / "ir"
        dsl_dir = out / "dsl"

    ir_dir.mkdir(parents=True, exist_ok=True)
    dsl_dir.mkdir(parents=True, exist_ok=True)

    normalized_path = ir_dir / f"{stem}_normalized.txt"
    ir_path = ir_dir / f"{stem}_ir.json"
    dsl_path = dsl_dir / f"{stem}.dsl"

    scripts = PROJECT_ROOT / "scripts"

    # Stage 1: Normalize
    print("[1/3] Normalizing...")
    result = subprocess.run(
        ["python3", str(scripts / "normalize.py"), str(input_path), "-o", str(normalized_path)],
        cwd=PROJECT_ROOT,
    )
    if result.returncode != 0:
        return result.returncode

    # Stage 2-4: Extract IR
    print("[2/3] Extracting IR...")
    result = subprocess.run(
        ["python3", str(scripts / "extract_ir.py"), str(normalized_path), "-o", str(ir_path)],
        cwd=PROJECT_ROOT,
    )
    if result.returncode != 0:
        return result.returncode

    # Stage 5: Render DSL
    print("[3/3] Rendering DSL...")
    result = subprocess.run(
        ["python3", str(scripts / "render_dsl.py"), str(ir_path), "-o", str(dsl_path)],
        cwd=PROJECT_ROOT,
    )
    if result.returncode != 0:
        return result.returncode

    print(f"\nDone. IR: {ir_path}")
    print(f"DSL: {dsl_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
