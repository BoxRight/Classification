#!/usr/bin/env python3
"""
Stage 5: DSL reconstruction.

Renders IR JSON to DSL text.
"""

import argparse
import json
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.dsl.renderer import render_ir
from src.dsl.sanitizer import sanitize_ir


def main():
    parser = argparse.ArgumentParser(description="Render IR to DSL")
    parser.add_argument("input", help="Path to IR JSON file")
    parser.add_argument("-o", "--output", help="Output DSL path")
    args = parser.parse_args()

    input_path = Path(args.input).resolve()
    if not input_path.exists():
        print(f"Error: {input_path} not found", file=sys.stderr)
        return 1

    ir = json.loads(input_path.read_text(encoding="utf-8"))
    ir = sanitize_ir(ir)
    dsl = render_ir(ir)

    if args.output:
        output_path = Path(args.output).resolve()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(dsl, encoding="utf-8")
        print(f"Wrote {output_path}")
    else:
        print(dsl)

    return 0


if __name__ == "__main__":
    sys.exit(main())
