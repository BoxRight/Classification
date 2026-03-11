"""
Assemble IR from parsed clauses.
"""

from typing import Any

from src.pipeline.grammar import ParsedClause
from src.pipeline.ontology import Ontology


def build_ir(
    parsed: list[ParsedClause],
    source_name: str = "",
    *,
    strict: bool = True,
) -> dict[str, Any]:
    """
    Build IR JSON from parsed clauses.

    strict: if True, only include clauses with ontology-valid identifiers.
    """
    parties: set[str] = set()
    objects: set[str] = set()
    norms: list[dict] = []
    rules: list[dict] = []
    facts: list[dict] = []
    acts: list[dict] = []
    unresolved: list[str] = []

    rule_id = 0

    for p in parsed:
        if p.unresolved:
            unresolved.append(p.raw)
            continue

        if p.kind == "rule":
            rule_id += 1
            rules.append({
                "id": f"rule_{rule_id}",
                "conditions": p.conditions,
                "consequence": p.consequence,
            })
            continue

        if p.kind in ("obligation", "claim", "prohibition", "privilege"):
            act_node = {
                "type": "counter" if p.is_counter else "simple",
                "actor": p.actor,
                "object": p.object_id,
                "target": p.target or None,
            }
            if p.actor:
                parties.add(p.actor)
            if p.target:
                parties.add(p.target)
            if p.object_id:
                objects.add(p.object_id)

            norm = {
                "modality": p.kind,
                "act": act_node,
            }
            norms.append(norm)

    # Build parties list
    parties_list = [
        {"id": pid, "type": "person", "subtype": "physical"}
        for pid in sorted(parties)
    ]

    # Build objects list (need ontology for types)
    ontology = Ontology()
    objects_list = [
        {"id": oid, "type": ontology.get_object_type(oid)}
        for oid in sorted(objects)
    ]

    ir = {
        "law": source_name or "unknown",
        "authority": "private",
        "enacted": None,
        "imports": [],
        "parties": parties_list,
        "objects": objects_list,
        "acts": acts,
        "facts": facts,
        "norms": norms,
        "rules": rules,
        "procedures": [],
        "scenarios": [],
    }
    if unresolved:
        ir["_unresolved"] = unresolved
    return ir
