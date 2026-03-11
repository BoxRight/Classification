#!/usr/bin/env python3
"""
Extract rule templates from IR corpus.

High-frequency condition → consequence patterns become canonical rule templates.
"""

import json
import re
import sys
from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from src.ontology.extractor import extract_vocabulary, load_all_irs


def load_config() -> dict:
    """Load extraction config."""
    try:
        import yaml
    except ImportError:
        return {}
    config_path = PROJECT_ROOT / "config" / "extraction.yaml"
    if config_path.exists():
        return yaml.safe_load(config_path.read_text()) or {}
    return {}


def parse_consequence(cons_sig: str) -> dict:
    """Parse consequence signature into modality and act_signature."""
    # obligation(tenant→monthly_rent→landlord)
    # fact:liability:ContractNullity
    if cons_sig.startswith("fact:"):
        parts = cons_sig.split(":", 2)
        return {"type": "fact", "fact_type": parts[1] if len(parts) > 1 else "?", "fact_name": parts[2] if len(parts) > 2 else "?"}
    match = re.match(r"^(\w+)\(([^)]*)\)$", cons_sig)
    if match:
        modality, act_sig = match.groups()
        return {"modality": modality, "act_signature": act_sig}
    return {"modality": "?", "act_signature": "?"}


def main():
    config = load_config()
    paths = config.get("paths", {})
    thresholds = config.get("thresholds", {})

    downloads = Path(paths.get("downloads", "downloads"))
    templates_dir = Path(paths.get("templates", "templates"))
    rule_th = thresholds.get("rule", 3)

    downloads_path = (PROJECT_ROOT / downloads).resolve()
    templates_path = (PROJECT_ROOT / templates_dir).resolve()

    if not downloads_path.exists():
        print(f"Error: {downloads_path} not found")
        return 1

    templates_path.mkdir(parents=True, exist_ok=True)

    irs = list(load_all_irs(downloads_path))
    vocab = extract_vocabulary(iter(irs), rule_threshold=rule_th)

    rule_patterns = vocab["rule_patterns"]

    templates_list = []
    for (cond_tuple, cons_sig), count in rule_patterns.items():
        if count < rule_th:
            continue
        conditions = list(cond_tuple)
        parsed = parse_consequence(cons_sig)
        pattern_str = " + ".join(conditions) + " → " + cons_sig
        templates_list.append({
            "pattern": pattern_str,
            "conditions": conditions,
            "consequence": parsed,
            "count": count,
        })

    templates_list.sort(key=lambda x: -x["count"])

    out = {
        "templates": templates_list,
        "threshold": rule_th,
    }
    (templates_path / "rules.json").write_text(
        json.dumps(out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"templates/rules.json: {len(templates_list)} rule templates")
    return 0


if __name__ == "__main__":
    sys.exit(main())
