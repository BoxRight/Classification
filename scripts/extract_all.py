#!/usr/bin/env python3
"""
Run the full ontology and template extraction pipeline.

Executes in order: extract_ontology → extract_act_templates → extract_rule_templates.
"""

import subprocess
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent


def main():
    scripts = [
        "extract_ontology.py",
        "extract_act_templates.py",
        "extract_rule_templates.py",
    ]
    for name in scripts:
        script = Path(__file__).parent / name
        print(f"\n--- {name} ---")
        result = subprocess.run(
            ["python3", str(script)],
            cwd=PROJECT_ROOT,
        )
        if result.returncode != 0:
            print(f"Error: {name} failed with code {result.returncode}")
            return result.returncode
    print("\n--- Done ---")
    return 0


if __name__ == "__main__":
    sys.exit(main())
