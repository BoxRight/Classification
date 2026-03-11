#!/usr/bin/env python3
"""
Stages 2-4: Ontology binding, act extraction, rule construction.

Parses normalized text with finite grammar and builds IR.
"""

import argparse
import json
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.pipeline.normalizer import normalize_to_clauses
from src.pipeline.ontology import Ontology
from src.pipeline.grammar import parse_clauses
from src.pipeline.ir_builder import build_ir


def main():
    parser = argparse.ArgumentParser(description="Extract IR from normalized text")
    parser.add_argument("input", help="Path to normalized text file (or raw text to normalize first)")
    parser.add_argument("-o", "--output", help="Output IR JSON path")
    parser.add_argument("--strict", action="store_true", default=True, help="Reject unknown identifiers")
    parser.add_argument("--no-strict", action="store_false", dest="strict", help="Allow unknown identifiers")
    parser.add_argument("--llm-fallback", action="store_true", help="Send unresolved clauses to LLM (not implemented)")
    args = parser.parse_args()

    input_path = Path(args.input).resolve()
    if not input_path.exists():
        print(f"Error: {input_path} not found", file=sys.stderr)
        return 1

    text = input_path.read_text(encoding="utf-8")
    clauses = normalize_to_clauses(text)

    ontology = Ontology(PROJECT_ROOT)
    parsed = parse_clauses(clauses, ontology)
    ir = build_ir(parsed, source_name=input_path.name, strict=args.strict)

    if args.llm_fallback and ir.get("_unresolved"):
        print(f"Note: {len(ir['_unresolved'])} unresolved clauses (LLM fallback not implemented)", file=sys.stderr)

    if args.output:
        output_path = Path(args.output).resolve()
        output_path.parent.mkdir(parents=True, exist_ok=True)
        output_path.write_text(json.dumps(ir, indent=2, ensure_ascii=False), encoding="utf-8")
        print(f"Wrote {output_path}")
    else:
        print(json.dumps(ir, indent=2, ensure_ascii=False))

    return 0


if __name__ == "__main__":
    sys.exit(main())
