#!/usr/bin/env python3
"""
CLI: Full Pipeline
Analyze → Generate IR → Select Artifacts
"""

import os
import sys
import json
import argparse

# Add parent directory to path for module imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from src.analysis.legal_document import analyze_document
from src.ir.generator import convert_to_normative_ir
from src.selector.artifact_selector import ArtifactSelector


def main():
    parser = argparse.ArgumentParser(description="Full contract processing pipeline")
    parser.add_argument("input_file", help="Path to contract text file (.txt)")
    parser.add_argument("--registry", default="config/legal_registry.json",
                        help="Path to legal registry")
    parser.add_argument("--output", help="Output path for complete IR (default: input_file_complete.json)")
    args = parser.parse_args()
    
    input_path = os.path.abspath(args.input_file)
    
    if not os.path.exists(input_path):
        print(f"Error: File not found: {input_path}")
        return 1
    
    print("=" * 60)
    print("LEGAL CONTRACT PROCESSING PIPELINE")
    print("=" * 60)
    
    # Step 1: Analysis
    print("\n[1/3] Analyzing contract...")
    with open(input_path, 'r', encoding='utf-8') as f:
        text = f.read()
    
    basic_analysis = analyze_document(input_path)
    if not basic_analysis:
        print("Error: Analysis failed")
        return 1
    
    print(f"  ✓ Found {len(basic_analysis['object']['behaviors'])} behaviors")
    
    # Step 2: IR Generation
    print("\n[2/3] Generating normative IR...")
    ir = convert_to_normative_ir(basic_analysis, text)
    
    print(f"  ✓ Roles: {len(ir['roles'])}")
    print(f"  ✓ Objects: {len(ir['objects'])}")
    print(f"  ✓ Behaviors: {len(ir['behaviors'])}")
    print(f"  ✓ Facts: {len(ir['facts'])}")
    print(f"  ✓ Normative clauses: {len(ir['principal_contract']['normative_clauses'])}")
    
    # Step 3: Artifact Selection
    print("\n[3/3] Selecting artifacts...")
    registry_path = args.registry
    if not os.path.exists(registry_path):
        print(f"  Warning: Registry not found at {registry_path}, skipping selection")
        result = {"institution": None, "templates": [], "principles": []}
    else:
        selector = ArtifactSelector(registry_path)
        result = selector.select_artifacts(ir)
    
    print(f"  ✓ Institution: {result['institution']}")
    print(f"  ✓ Templates: {len(result['templates'])}")
    print(f"  ✓ Principles: {len(result['principles'])}")
    
    # Augment IR
    ir["institution"] = result["institution"]
    ir["principal_contract"]["templates"] = result["templates"]
    ir["principles"] = result["principles"]
    
    # Save output
    if args.output:
        output_path = args.output
    else:
        output_path = input_path.replace('.txt', '_complete.json')
    
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump(ir, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Complete IR saved to: {output_path}")
    print("=" * 60)
    
    return 0


if __name__ == "__main__":
    sys.exit(main())
