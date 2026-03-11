#!/usr/bin/env python3
"""
Extract canonical ontology (roles, objects, institutions) from IR corpus.
"""

import json
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


def main():
    config = load_config()
    paths = config.get("paths", {})
    thresholds = config.get("thresholds", {})

    downloads = Path(paths.get("downloads", "downloads"))
    ontology_dir = Path(paths.get("ontology", "ontology"))
    downloads_path = (PROJECT_ROOT / downloads).resolve()
    ontology_path = (PROJECT_ROOT / ontology_dir).resolve()

    if not downloads_path.exists():
        print(f"Error: {downloads_path} not found")
        return 1

    ontology_path.mkdir(parents=True, exist_ok=True)

    role_th = thresholds.get("role", 5)
    object_th = thresholds.get("object", 5)
    fact_th = thresholds.get("institution", thresholds.get("fact", 5))

    irs = list(load_all_irs(downloads_path))
    vocab = extract_vocabulary(
        iter(irs),
        role_threshold=role_th,
        object_threshold=object_th,
        fact_threshold=fact_th,
    )

    # Roles
    canonical_roles = [r for r, c in vocab["parties"].items() if c >= role_th]
    roles_out = {
        "canonical": sorted(canonical_roles),
        "counts": dict(vocab["parties"]),
        "threshold": role_th,
    }
    (ontology_path / "roles.json").write_text(
        json.dumps(roles_out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"ontology/roles.json: {len(canonical_roles)} canonical roles")

    # Objects (with types)
    object_counts = vocab["objects"]
    object_types = vocab["object_types"]
    canonical_objects = [
        {"id": oid, "type": object_types.get(oid, "nonmovable")}
        for oid, c in object_counts.items()
        if c >= object_th
    ]
    canonical_objects.sort(key=lambda x: (-object_counts.get(x["id"], 0), x["id"]))
    objects_out = {
        "canonical": canonical_objects,
        "counts": dict(object_counts),
        "threshold": object_th,
    }
    (ontology_path / "objects.json").write_text(
        json.dumps(objects_out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"ontology/objects.json: {len(canonical_objects)} canonical objects")

    # Institutions (fact names)
    canonical_facts = sorted([f for f, c in vocab["facts"].items() if c >= fact_th])
    institutions_out = {
        "canonical": canonical_facts,
        "counts": dict(vocab["facts"]),
        "threshold": fact_th,
    }
    (ontology_path / "institutions.json").write_text(
        json.dumps(institutions_out, indent=2, ensure_ascii=False), encoding="utf-8"
    )
    print(f"ontology/institutions.json: {len(canonical_facts)} canonical institutions")

    return 0


if __name__ == "__main__":
    sys.exit(main())
