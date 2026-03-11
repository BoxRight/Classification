"""
Shared vocabulary extraction from IR corpus.

Provides load_all_irs() and extract_vocabulary() for the ontology
and template extraction pipeline.
"""

import json
from collections import Counter, defaultdict
from pathlib import Path
from typing import Iterator


def load_ir(path: Path) -> dict | None:
    """Load and parse an IR JSON file."""
    try:
        return json.loads(path.read_text(encoding="utf-8"))
    except Exception:
        return None


def load_all_irs(root: Path) -> Iterator[dict]:
    """Yield parsed IR dicts from all *_ir.json files under root."""
    for path in sorted(root.rglob("*_ir.json")):
        ir = load_ir(path)
        if ir:
            yield ir


def _act_signature(act: dict) -> str:
    """Canonical signature for an act: actor→object→target."""
    a = act.get("actor", "")
    o = act.get("object") or ""
    t = act.get("target") or ""
    return f"{a}→{o}→{t}"


def _condition_signature(cond: dict) -> str:
    """Normalize a rule condition to a string signature."""
    if not isinstance(cond, dict):
        return "?"
    if "ref" in cond:
        return f"ref:{cond['ref']}"
    t = cond.get("type", "?")
    n = cond.get("name", "")
    if n:
        return f"{t}:{n}"
    # Act-like condition (counter, simple)
    if "actor" in cond or "object" in cond:
        a = cond.get("actor", "")
        o = cond.get("object") or ""
        tgt = cond.get("target") or ""
        return f"{t}:{a}→{o}→{tgt}" if (a or o or tgt) else t
    return t


def _consequence_signature(cons: dict) -> str:
    """Normalize a rule consequence to a string signature."""
    if not isinstance(cons, dict):
        return "?"
    if "modality" in cons:
        act = cons.get("act")
        if isinstance(act, dict):
            return f"{cons['modality']}({_act_signature(act)})"
        return f"{cons['modality']}(→→)"
    # Fact consequence
    if "type" in cons and "name" in cons:
        return f"fact:{cons['type']}:{cons['name']}"
    return "?"


def extract_vocabulary(
    irs: Iterator[dict],
    *,
    role_threshold: int = 5,
    object_threshold: int = 5,
    fact_threshold: int = 5,
    act_threshold: int = 5,
    rule_threshold: int = 3,
) -> dict:
    """
    Single pass over IRs returning raw counts for ontology/template extraction.

    Returns:
        parties: Counter[party_id]
        objects: Counter[object_id]
        object_types: dict[object_id, most_common_type]
        facts: Counter[fact_name]
        act_sigs: Counter[act_signature]
        rule_patterns: Counter[(cond_tuple, cons_sig)]
    """
    party_counts = Counter()
    object_counts = Counter()
    object_id_to_types: dict[str, Counter] = defaultdict(Counter)
    fact_counts = Counter()
    act_sigs = Counter()
    rule_patterns: Counter = Counter()

    for ir in irs:
        for p in ir.get("parties", []):
            if isinstance(p, dict):
                pid = p.get("id", "")
                if pid:
                    party_counts[pid] += 1

        for o in ir.get("objects", []):
            if isinstance(o, dict):
                oid = o.get("id", "")
                otype = o.get("type", "nonmovable")
                if oid:
                    object_counts[oid] += 1
                    object_id_to_types[oid][otype] += 1

        for f in ir.get("facts", []):
            if isinstance(f, dict):
                fname = f.get("name", "")
                if fname:
                    fact_counts[fname] += 1

        for n in ir.get("norms", []):
            if isinstance(n, dict):
                act = n.get("act")
                if isinstance(act, dict):
                    act_sigs[_act_signature(act)] += 1

        for a in ir.get("acts", []):
            if isinstance(a, dict):
                act_sigs[_act_signature(a)] += 1

        for r in ir.get("rules", []):
            if isinstance(r, dict):
                conds = []
                for c in r.get("conditions", []):
                    conds.append(_condition_signature(c))
                cons = r.get("consequence", {})
                cons_sig = _consequence_signature(cons)
                key = (tuple(sorted(conds)), cons_sig)
                rule_patterns[key] += 1

    # Resolve majority type per object id
    object_types = {
        oid: types.most_common(1)[0][0]
        for oid, types in object_id_to_types.items()
    }

    return {
        "parties": party_counts,
        "objects": object_counts,
        "object_types": object_types,
        "facts": fact_counts,
        "act_sigs": act_sigs,
        "rule_patterns": rule_patterns,
        "thresholds": {
            "role": role_threshold,
            "object": object_threshold,
            "fact": fact_threshold,
            "act": act_threshold,
            "rule": rule_threshold,
        },
    }
