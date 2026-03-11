"""
Stage 3-4: Grammar-based clause parsing.

Finite grammar for OBLIGATION, CLAIM, PROHIBITION, PRIVILEGE, RULE.
"""

import re
from dataclasses import dataclass, field
from typing import Any

# Breach/counteract triggers
COUNTER_TRIGGERS = [
    "fails to", "does not", "omits", "breach", "incumple",
    "no cumple", "incumplimiento", "falta de", "failure to",
]

# Conditional triggers
CONDITIONAL_TRIGGERS = ["if", "cuando", "when", "en caso de que", "si"]


@dataclass
class ParsedClause:
    """Result of parsing a clause."""
    kind: str  # obligation, claim, prohibition, privilege, rule
    actor: str = ""
    object_id: str = ""
    target: str = ""
    verb: str = ""
    is_counter: bool = False
    conditions: list[dict] = field(default_factory=list)
    consequence: dict[str, Any] = field(default_factory=dict)
    raw: str = ""
    unresolved: bool = False


def _is_counter(clause: str) -> bool:
    """Check if clause indicates a counteract (breach)."""
    lower = clause.lower()
    return any(t in lower for t in COUNTER_TRIGGERS)


def _extract_conditional(clause: str) -> tuple[list[str], str] | None:
    """Extract IF condition THEN consequence. Returns (conditions, consequence) or None."""
    lower = clause.lower()
    for trigger in CONDITIONAL_TRIGGERS:
        if trigger in lower:
            parts = re.split(r"\s+then\s+|\s+el\s+|\s+la\s+", clause, maxsplit=1, flags=re.I)
            if len(parts) >= 2:
                cond_part = parts[0]
                cons_part = parts[1] if len(parts) > 1 else ""
                # Extract condition phrase after trigger
                cond_match = re.search(rf"{re.escape(trigger)}\s+(.+?)(?:\s+then|\s+el\s+|\s+la\s+|$)", lower, re.I | re.DOTALL)
                if cond_match:
                    return ([cond_match.group(1).strip()], cons_part.strip())
    return None


def parse_clause(
    clause: str,
    ontology: "Ontology",
) -> ParsedClause:
    """
    Parse a normalized clause against the finite grammar.

    Returns ParsedClause with kind, actor, object, target, verb.
    Sets unresolved=True if no pattern matches.
    """
    lower = clause.lower().strip()
    words = lower.split()

    # Check for conditional rule first
    cond_result = _extract_conditional(clause)
    if cond_result:
        cond_strs, cons_str = cond_result
        conditions = []
        for c in cond_strs:
            # Try to match institution
            for inst in ontology.institutions:
                if inst.lower() in c:
                    conditions.append({"type": "asset", "name": inst})
                    break
            if not conditions and _is_counter(c):
                conditions.append({"type": "counter"})
        if conditions and cons_str:
            # Parse consequence as obligation/privilege
            cons_parsed = parse_clause(cons_str, ontology)
            if not cons_parsed.unresolved:
                return ParsedClause(
                    kind="rule",
                    conditions=conditions,
                    consequence={
                        "modality": cons_parsed.kind,
                        "act": {
                            "actor": cons_parsed.actor,
                            "object": cons_parsed.object_id,
                            "target": cons_parsed.target,
                            "type": "counter" if cons_parsed.is_counter else "simple",
                        },
                    },
                    raw=clause,
                )

    is_counter = _is_counter(clause)

    # OBLIGATION: <role> must <verb> <object> to <role>
    m = re.search(r"(\w+)\s+must\s+(\w+)\s+(\w+)\s+to\s+(\w+)", lower)
    if m:
        actor, verb, obj, target = m.groups()
        if ontology.is_role(actor) and ontology.is_object(obj) and ontology.is_role(target):
            return ParsedClause(
                kind="obligation",
                actor=actor,
                object_id=obj,
                target=target,
                verb=verb,
                is_counter=is_counter,
                raw=clause,
            )

    # OBLIGATION variant: <role> <verb> <object> to <role> (implicit must)
    m = re.search(r"(\w+)\s+(?:pay|transfer|deliver|entregar)\s+(\w+)\s+to\s+(\w+)", lower)
    if m:
        actor, obj, target = m.groups()
        if ontology.is_role(actor) and ontology.is_object(obj) and ontology.is_role(target):
            return ParsedClause(
                kind="obligation",
                actor=actor,
                object_id=obj,
                target=target,
                verb="pay",
                is_counter=is_counter,
                raw=clause,
            )

    # PROHIBITION: <role> must not <verb> <object>
    m = re.search(r"(\w+)\s+must_not\s+(\w+)\s+(\w+)", lower)
    if m:
        actor, verb, obj = m.groups()
        if ontology.is_role(actor) and ontology.is_object(obj):
            return ParsedClause(
                kind="prohibition",
                actor=actor,
                object_id=obj,
                verb=verb,
                is_counter=False,
                raw=clause,
            )

    # PROHIBITION: prohibido <verb> <object>
    m = re.search(r"prohibit\s+(\w+)\s+(\w+)", lower)
    if m:
        verb, obj = m.groups()
        if ontology.is_object(obj):
            return ParsedClause(
                kind="prohibition",
                object_id=obj,
                verb=verb,
                raw=clause,
            )

    # PRIVILEGE: <role> may <verb> <object> to <role>
    m = re.search(r"(\w+)\s+may\s+(\w+)\s+(\w+)\s+to\s+(\w+)", lower)
    if m:
        actor, verb, obj, target = m.groups()
        if ontology.is_role(actor) and ontology.is_object(obj) and ontology.is_role(target):
            return ParsedClause(
                kind="privilege",
                actor=actor,
                object_id=obj,
                target=target,
                verb=verb,
                is_counter=is_counter,
                raw=clause,
            )

    # CLAIM: <role> may demand <object> from <role>
    m = re.search(r"(\w+)\s+demand\s+(\w+)\s+from\s+(\w+)", lower)
    if m:
        actor, obj, target = m.groups()
        if ontology.is_role(actor) and ontology.is_object(obj) and ontology.is_role(target):
            return ParsedClause(
                kind="claim",
                actor=actor,
                object_id=obj,
                target=target,
                verb="demand",
                raw=clause,
            )

    # Simple payment: tenant pay monthly_rent landlord (object between verb and target)
    if len(words) >= 4:
        w0, w1, w2, w3 = words[0], words[1], words[2], words[3]
        if ontology.is_role(w0) and ontology.is_object(w2) and ontology.is_role(w3):
            if w1 in ("pay", "paga", "pagará"):
                return ParsedClause(
                    kind="obligation",
                    actor=w0,
                    object_id=w2,
                    target=w3,
                    verb="pay",
                    raw=clause,
                )
        # tenant pay landlord monthly_rent (target before object)
        if ontology.is_role(w0) and ontology.is_role(w2) and ontology.is_object(w3):
            if w1 in ("pay", "paga", "pagará"):
                return ParsedClause(
                    kind="obligation",
                    actor=w0,
                    object_id=w3,
                    target=w2,
                    verb="pay",
                    raw=clause,
                )

    # Flexible: find role + pay + role in clause, and object elsewhere (common in long clauses)
    if len(words) >= 3:
        for i in range(len(words) - 2):
            w0, w1, w2 = words[i], words[i + 1], words[i + 2]
            if ontology.is_role(w0) and w1 in ("pay", "paga", "pagará") and ontology.is_role(w2):
                # Look for money object in clause
                obj_candidate = "monthly_rent"
                for w in words:
                    if ontology.is_object(w) and ontology.get_object_type(w) == "money":
                        obj_candidate = w
                        break
                return ParsedClause(
                    kind="obligation",
                    actor=w0,
                    object_id=obj_candidate,
                    target=w2,
                    verb="pay",
                    raw=clause,
                )

    return ParsedClause(kind="?", raw=clause, unresolved=True)


def parse_clauses(
    clauses: list[str],
    ontology: "Ontology",
) -> list[ParsedClause]:
    """Parse a list of normalized clauses."""
    return [parse_clause(c, ontology) for c in clauses]
