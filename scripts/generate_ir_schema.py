#!/usr/bin/env python3
"""Generate config/ir_agent_schema.json from Pydantic models."""

import json
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.ir.agent_models import get_json_schema

if __name__ == "__main__":
    schema = get_json_schema()
    out_path = PROJECT_ROOT / "config" / "ir_agent_schema.json"
    out_path.write_text(json.dumps(schema, indent=2), encoding="utf-8")
    print(f"Wrote {out_path}")
