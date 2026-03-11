#!/usr/bin/env python3
"""
Extract act templates from IR corpus.

Groups high-frequency act signatures by object type into canonical templates
(Payment, Transfer, Service, etc.).
"""

import json
import sys
from collections import defaultdict
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


def parse_act_signature(sig: str) -> tuple[str, str, str]:
    """Parse actor→object→target into (actor, object, target)."""
    parts = sig.split("→", 2)
    actor = parts[0] if len(parts) > 0 else ""
    object_id = parts[1] if len(parts) > 1 else ""
    target = parts[2] if len(parts) > 2 else ""
    return (actor, object_id, target)


def infer_template_name(object_type: str) -> str:
    """Map object type to template family."""
    if object_type in ("money",):
        return "Payment"
    if object_type in ("nonmovable", "movable"):
        return "Transfer"
    if object_type in ("service",):
        return "Service"
    return "Act"


def main():
    config = load_config()
    paths = config.get("paths", {})
    thresholds = config.get("thresholds", {})

    downloads = Path(paths.get("downloads", "downloads"))
    templates_dir = Path(paths.get("templates", "templates"))
    act_th = thresholds.get("act", 5)

    downloads_path = (PROJECT_ROOT / downloads).resolve()
    templates_path = (PROJECT_ROOT / templates_dir).resolve()

    if not downloads_path.exists():
        print(f"Error: {downloads_path} not found")
        return 1

    templates_path.mkdir(parents=True, exist_ok=True)

    irs = list(load_all_irs(downloads_path))
    vocab = extract_vocabulary(iter(irs), act_threshold=act_th)

    act_sigs = vocab["act_sigs"]
    object_types = vocab["object_types"]

    # Group by template (object type)
    template_to_instances: dict[str, list[dict]] = defaultdict(list)

    for sig, count in act_sigs.items():
        if count < act_th:
            continue
        actor, object_id, target = parse_act_signature(sig)
        if not object_id:
            obj_type = "?"
        else:
            obj_type = object_types.get(object_id, "nonmovable")
        template_name = infer_template_name(obj_type)
        template_to_instances[template_name].append({
            "actor": actor,
            "object": object_id,
            "target": target,
            "count": count,
        })

    # Build output
    templates_list = []
    slot_names = {
        "Payment": ["payer", "amount", "receiver"],
        "Transfer": ["owner", "property", "recipient"],
        "Service": ["provider", "service", "client"],
        "Act": ["actor", "object", "target"],
    }
    sig_templates = {
        "Payment": "Payer→Amount→Receiver",
        "Transfer": "Owner→Property→Recipient",
        "Service": "Provider→Service→Client",
        "Act": "Actor→Object→Target",
    }

    for template_name in ["Payment", "Transfer", "Service", "Act"]:
        instances = template_to_instances.get(template_name, [])
        if not instances:
            continue
        instances.sort(key=lambda x: -x["count"])
        templates_list.append({
            "name": template_name,
            "signature": sig_templates[template_name],
            "slots": slot_names[template_name],
            "instances": instances,
        })

    out = {
        "templates": templates_list,
        "threshold": act_th,
    }
    (templates_path / "acts.json").write_text(
        json.dumps(out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"templates/acts.json: {len(templates_list)} act templates")
    return 0


if __name__ == "__main__":
    sys.exit(main())
