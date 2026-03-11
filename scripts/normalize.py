#!/usr/bin/env python3
"""
Stage 1: Normalization.

Normalizes source text using the dictionary. Replaces terms with canonical identifiers.
"""

import argparse
import json
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.pipeline.normalizer import normalize_text, normalize_to_clauses


def main():
    parser = argparse.ArgumentParser(description="Normalize legal text using dictionary")
    parser.add_argument("input", help="Path to source text file")
    parser.add_argument("-o", "--output", help="Output path (default: stdout or input_normalized.txt)")
    parser.add_argument("--clauses", action="store_true", help="Output as JSON array of normalized clauses")
    args = parser.parse_args()

    input_path = Path(args.input).resolve()
    if not input_path.exists():
        print(f"Error: {input_path} not found", file=sys.stderr)
        return 1

    text = input_path.read_text(encoding="utf-8")

    if args.clauses:
        clauses = normalize_to_clauses(text)
        out = json.dumps(clauses, indent=2, ensure_ascii=False)
    else:
        out = normalize_text(text)

    if args.output:
        output_path = Path(args.output).resolve()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(out, encoding="utf-8")
        print(f"Wrote {output_path}")
    else:
        print(out)

    return 0


if __name__ == "__main__":
    sys.exit(main())
