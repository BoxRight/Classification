"""
Full IR → DSL deterministic renderer.

Renders agent-generated IR (parties, objects, facts, norms, rules, procedures, scenarios)
to DSL text conforming to the Haskell parser grammar in Parser.hs.

Enforces canonical identifiers via NameRegistry: every identifier is derived from
a single canonical transformation so the same IR id always emits the same DSL form.
"""

import logging
import re
from typing import Any

logger = logging.getLogger(__name__)

VALID_OBJECT_KINDS = ("movable", "nonmovable", "non_movable", "expendable", "money", "service")

# Parser-supported intrinsic predicates (Parser.hs knownIntrinsics)
PARSER_INTRINSICS = (
    "aboveThreshold",
    "belowThreshold",
    "between",
    "daysBetween",
    "withinWindow",
    "percentage",
    "taxAmount",
)

# Verb mapping for event acts when object is not in objects (event id, not thing)
EVENT_VERB_MAP: dict[str, list[str]] = {
    "cancel": ["cancel_event", "cancel_booking", "notify_cancellation", "cancel"],
    "notify": ["notify_30_days", "notify_cancellation", "notify_advance", "notify"],
    "cause": ["cause_damage", "cause_loss", "cause"],
    "file": ["file_claim", "file_complaint", "file"],
}


def _to_snake(s: str) -> str:
    """Convert PascalCase/camelCase to snake_case for normalization."""
    if not s:
        return ""
    s = str(s).strip()
    # Insert underscore before uppercase letters (except first)
    result = re.sub(r"(?<=[a-z0-9])([A-Z])", r"_\1", s)
    return result.lower().replace("-", "_").replace(" ", "_")


def canonical(name: str) -> str:
    """
    Convert any identifier to canonical PascalCase.

    Handles snake_case, camelCase, and mixed forms. Ensures deterministic output:
    canonical("advance_payment") -> AdvancePayment
    canonical("AdvancePayment") -> AdvancePayment
    canonical("lease_relation") -> LeaseRelation
    """
    if not name:
        return ""
    snake = _to_snake(name)
    parts = [p for p in re.split(r"[_\s-]+", snake) if p]
    return "".join(p.capitalize() for p in parts)


class NameRegistry:
    """
    Single canonical identifier layer per module.

    Guarantees the same raw id always emits the same DSL identifier.
    Use for parties, objects, facts, rules, procedures.
    """

    def __init__(self) -> None:
        self._map: dict[str, str] = {}

    def get(self, raw_id: str) -> str:
        """Return canonical form for raw_id. Same raw_id always returns same result."""
        if not raw_id:
            return ""
        key = _to_snake(raw_id)
        if key not in self._map:
            self._map[key] = canonical(raw_id)
        return self._map[key]


def _build_objects_by_id(ir: dict) -> dict[str, str]:
    """Build id -> type mapping from IR objects."""
    by_id = {}
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
            by_id[o["id"]] = o.get("type", "nonmovable")
    return by_id


def _build_acts_by_id(ir: dict) -> dict[str, dict]:
    """Build id -> act mapping from IR acts."""
    by_id = {}
    for a in ir.get("acts", []):
        if isinstance(a, dict) and a.get("id"):
            by_id[a["id"]] = a
    return by_id


def _infer_verb_for_event(obj_id: str) -> str | None:
    """Infer verb for event acts when object is an event id, not a thing."""
    if not obj_id:
        return None
    obj_lower = obj_id.lower().replace("-", "_")
    for verb, patterns in EVENT_VERB_MAP.items():
        for p in patterns:
            if obj_lower == p or obj_lower.startswith(p + "_") or p in obj_lower:
                return verb
    return None


def infer_verb(act: dict, objects_by_id: dict[str, str], *, for_counteract: bool = False) -> str:
    """
    Infer verb: (1) _verb hint, (2) decomposition, (3) object type, (4) event map, (5) perform.
    Event classification: object type 'service' treated as event act.
    """
    if act.get("_verb"):
        return act["_verb"]
    if not for_counteract and act.get("type") == "counter":
        return "fail"
    obj_id = act.get("object") or ""
    obj_type = objects_by_id.get(obj_id)
    if obj_type is not None:
        if obj_type == "money":
            return "pay"
        if obj_type in ("nonmovable", "movable"):
            return "transfer"
        if obj_type == "service":
            return _infer_verb_for_event(obj_id) or "provide"
        return "transfer"
    # Object not in objects_by_id: try decomposition
    try:
        from src.dsl.decomposition import decompose
        from src.dsl.verb_registry import load_canonical_verbs
        decomp = decompose(obj_id, load_canonical_verbs())
        if decomp:
            return decomp[0]
    except Exception:
        pass
    event_verb = _infer_verb_for_event(obj_id)
    if event_verb:
        return event_verb
    return "perform"


def _render_action_phrase(
    act: dict,
    objects_by_id: dict[str, str],
    registry: NameRegistry,
    *,
    with_modality: str | None = None,
) -> str:
    """Render act as action phrase: Actor verb Object [to Target]."""
    actor = registry.get(act.get("actor", ""))
    obj_id = act.get("object", "")
    obj_str = registry.get(obj_id) if obj_id else ""
    target = act.get("target")
    verb = infer_verb(act, objects_by_id)
    target_str = registry.get(target) if target else ""
    if with_modality == "obligation":
        if target_str:
            return f"{actor} must {verb} {obj_str} to {target_str}."
        return f"{actor} must {verb} {obj_str}."
    if with_modality == "prohibition":
        return f"{actor} must not {verb} {obj_str}."
    if with_modality == "privilege":
        if target_str:
            return f"{actor} may {verb} {obj_str} to {target_str}."
        return f"{actor} may {verb} {obj_str}."
    if with_modality == "claim":
        if target_str:
            return f"{actor} may demand {obj_str} from {target_str}."
        return f"{actor} may demand {obj_str}."
    # Plain action phrase (no modality) - use third-person verb
    verb_3p_map = {"pay": "pays", "transfer": "transfers", "provide": "provides", "cancel": "cancels", "notify": "notifies", "cause": "causes", "file": "files", "perform": "performs", "sublease": "subleases", "damage": "damages"}
    verb_3p = verb_3p_map.get(verb, verb + "s" if verb else verb)
    if target_str:
        return f"{actor} {verb_3p} {obj_str} to {target_str}."
    return f"{actor} {verb_3p} {obj_str}."


def render_condition(
    cond: dict, objects_by_id: dict[str, str], registry: NameRegistry
) -> str | None:
    """Render a rule condition to parser-supported DSL string. Returns None if unsupported."""
    if not isinstance(cond, dict):
        return None
    # Ref conditions are not supported by parser; caller should resolve
    if "ref" in cond and not cond.get("type") and not cond.get("name"):
        return None
    ctype = cond.get("type", "")
    name = cond.get("name", "")
    # Institutional conditions: full sentence form
    if ctype == "asset" and name:
        return f"asset {registry.get(name)} is present"
    if ctype == "liability" and name:
        return f"liability {registry.get(name)} is present"
    if ctype == "collateral" and name:
        return f"collateral {registry.get(name)} is present"
    if ctype == "certification" and name:
        return f"certification {registry.get(name)} is present"
    if ctype == "ownership" and name:
        subject = cond.get("subject")
        obj = cond.get("object")
        if subject and obj:
            return f"{registry.get(subject)} owns {registry.get(obj)}"
        return None
    # Negated counter-act: intrinsic "not" with counter in args -> "Actor does not verb Object"
    if ctype == "intrinsic" and name == "not":
        args = cond.get("args", [])
        if len(args) == 1 and isinstance(args[0], dict):
            negated = args[0]
            if negated.get("type") == "counter" or ("actor" in negated and "object" in negated):
                actor = registry.get(negated.get("actor", ""))
                obj = registry.get(negated.get("object", ""))
                verb = infer_verb(negated, objects_by_id, for_counteract=True)
                return f"{actor} does not {verb} {obj}"
        return None

    # Intrinsic conditions (temporal, arithmetic)
    if ctype == "intrinsic":
        intrinsic_name = cond.get("name", "")
        args = cond.get("args", [])
        if intrinsic_name in PARSER_INTRINSICS and args:
            args_str = " ".join(str(a) for a in args)
            return f"{intrinsic_name} {args_str}"
        return None
    # Counter condition: Actor fails to verb Object to Target
    act = cond.get("act")
    if isinstance(act, dict) and (act.get("type") == "counter" or "actor" in act or "object" in act):
        actor = registry.get(act.get("actor", ""))
        obj = registry.get(act.get("object", ""))
        target = act.get("target")
        verb = infer_verb(act, objects_by_id, for_counteract=True)
        if target:
            return f"{actor} fails to {verb} {obj} to {registry.get(target)}"
        return f"{actor} fails to {verb} {obj}"
    if ctype == "counter" and ("actor" in cond or "object" in cond):
        actor = registry.get(cond.get("actor", ""))
        obj = registry.get(cond.get("object", ""))
        target = cond.get("target")
        verb = infer_verb(cond, objects_by_id, for_counteract=True)
        if target:
            return f"{actor} fails to {verb} {obj} to {registry.get(target)}"
        return f"{actor} fails to {verb} {obj}"
    # Positive event (counter-act correction converted to simple)
    if ctype == "simple" and cond.get("actor") and cond.get("object"):
        actor = registry.get(cond.get("actor", ""))
        obj = registry.get(cond.get("object", ""))
        verb = infer_verb(cond, objects_by_id)
        verb_3p_map = {"pay": "pays", "transfer": "transfers", "damage": "damages", "cause": "causes"}
        verb_3p = verb_3p_map.get(verb, verb + "s" if verb else verb)
        return f"{actor} {verb_3p} {obj}"
    return None


def render_consequence(
    cons: dict,
    objects_by_id: dict[str, str],
    acts_by_id: dict[str, dict],
    registry: NameRegistry,
) -> str | None:
    """Render rule consequence as modality sentence (no obligation/claim prefix). Returns None if unsupported."""
    if not isinstance(cons, dict):
        return None
    if "modality" in cons and "act" in cons:
        act = cons["act"]
        if isinstance(act, dict):
            # Resolve ref to act
            ref = act.get("ref")
            if ref and ref in acts_by_id:
                act = acts_by_id[ref]
            modality = cons["modality"]
            return _render_norm_sentence(modality, act, objects_by_id, registry)
    return None


def _render_norm_sentence(
    modality: str, act: dict, objects_by_id: dict[str, str], registry: NameRegistry
) -> str:
    """Render norm as modality sentence (for use in article clauses or rule consequence)."""
    actor = registry.get(act.get("actor", ""))
    obj_id = act.get("object", "")
    obj_str = registry.get(obj_id) if obj_id else ""
    target = act.get("target")
    verb = infer_verb(act, objects_by_id)
    target_str = registry.get(target) if target else ""
    if modality == "obligation":
        if target_str:
            return f"{actor} must {verb} {obj_str} to {target_str}."
        return f"{actor} must {verb} {obj_str}."
    if modality == "claim":
        if target_str:
            return f"{actor} may demand {obj_str} from {target_str}."
        return f"{actor} may demand {obj_str}."
    if modality == "prohibition":
        return f"{actor} must not {verb} {obj_str}."
    if modality == "privilege":
        if target_str:
            return f"{actor} may {verb} {obj_str} to {target_str}."
        return f"{actor} may {verb} {obj_str}."
    return f"{actor} {verb}s {obj_str}."


def _render_norm_clause(
    modality: str, act: dict, objects_by_id: dict[str, str], registry: NameRegistry
) -> str:
    """Render norm as article clause with modality keyword (obligation, claim, etc.)."""
    sentence = _render_norm_sentence(modality, act, objects_by_id, registry)
    if not sentence:
        return ""
    return f"{modality} {sentence}"


def render_header(ir: dict) -> list[str]:
    """Render law header (law, authority, enacted). Omit imports to avoid parse errors."""
    lines = []
    law = ir.get("law") or "unknown"
    lines.append(f"law {law}")
    authority = ir.get("authority") or "private"
    lines.append(f"authority {authority}")
    enacted = ir.get("enacted")
    if enacted:
        lines.append(f"enacted {enacted}")
    return lines


def render_vocabulary(ir: dict, objects_by_id: dict[str, str] | None = None) -> list[str]:
    """Render vocabulary with verbs only. Parser expects: verb surface: canonical."""
    lines = ["vocabulary"]
    verbs = ir.get("_verbs", [])
    if not verbs and objects_by_id:
        verbs = set()
        for n in ir.get("norms", []):
            if isinstance(n, dict) and isinstance(n.get("act"), dict):
                obj_id = n["act"].get("object", "")
                obj_type = (objects_by_id or {}).get(obj_id, "nonmovable")
                verbs.add("pay" if obj_type == "money" else "transfer" if obj_type in ("nonmovable", "movable") else "provide")
        for r in ir.get("rules", []):
            if isinstance(r, dict):
                cons = r.get("consequence", {})
                if isinstance(cons, dict) and "act" in cons:
                    act = cons["act"]
                    if isinstance(act, dict):
                        obj_id = act.get("object", "")
                        obj_type = (objects_by_id or {}).get(obj_id, "nonmovable")
                        verbs.add("pay" if obj_type == "money" else "transfer" if obj_type in ("nonmovable", "movable") else "provide")
        verbs = sorted(verbs)
    for v in verbs:
        lines.append(f"    verb {v}: {v}")
    return lines


def render_parties(ir: dict, registry: NameRegistry) -> list[str]:
    """Render parties block. Parser expects: Alias: display, subtype, capacity."""
    lines = ["parties"]
    for p in ir.get("parties", []):
        if isinstance(p, dict) and p.get("id"):
            alias = registry.get(p["id"])
            subtype = p.get("subtype", "physical")
            if subtype in ("physical", "natural"):
                subtype_str = "natural person"
            else:
                subtype_str = "legal person"
            display = p.get("display_name") or (f"{alias} Person" if subtype_str == "natural person" else f"{alias} Corp")
            lines.append(f"    {alias}: {display}, {subtype_str}")
    return lines


def render_objects(ir: dict, registry: NameRegistry) -> list[str]:
    """Render objects block. Parser accepts: movable, nonmovable, non_movable, expendable, money, service."""
    lines = ["objects"]
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
            alias = registry.get(o["id"])
            kind = o.get("type", "nonmovable")
            if kind not in VALID_OBJECT_KINDS:
                logger.warning("Unknown object kind %r for %s, mapping to nonmovable", kind, alias)
                kind = "nonmovable"
            lines.append(f"    {alias}: {kind}")
    return lines


def render_fact_sentence(f: dict, objects: list[dict], registry: NameRegistry) -> str | None:
    """Render a single fact as parser-supported natural-language sentence. Returns None if unsupported."""
    if not isinstance(f, dict) or not f.get("name"):
        return None
    ftype = f.get("type", "asset")
    name = registry.get(f.get("name", ""))
    subject = f.get("subject")
    obj = f.get("object")
    if ftype == "ownership":
        if not subject:
            return None
        owned_obj = obj or f.get("object")
        if owned_obj:
            return f"{registry.get(subject)} owns {registry.get(owned_obj)}"
        # Infer object from first nonmovable
        for o in objects:
            if isinstance(o, dict) and o.get("type") in ("nonmovable", "non_movable"):
                return f"{registry.get(subject)} owns {registry.get(o.get('id', ''))}"
        return None
    if ftype == "asset":
        return f"asset {name} is present"
    if ftype == "liability":
        return f"liability {name} is present"
    if ftype == "collateral":
        return f"collateral {name} is present"
    if ftype == "certification":
        return f"certification {name} is present"
    if ftype == "authority":
        return f"authority {name} is present"
    return None


def render_article_clauses(
    ir: dict,
    objects_by_id: dict[str, str],
    acts_by_id: dict[str, dict],
    registry: NameRegistry,
) -> list[str]:
    """Render all article clauses: facts, norms, rules, procedures. 4-space indent for clauses."""
    clauses = []
    objects = ir.get("objects", [])

    # Facts
    for f in ir.get("facts", []):
        sent = render_fact_sentence(f, objects, registry)
        if sent:
            clauses.append(f"    fact {sent}")

    # Norms (obligation, claim, prohibition, privilege)
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            modality = n.get("modality", "")
            act = n.get("act", {})
            if isinstance(act, dict):
                line = _render_norm_clause(modality, act, objects_by_id, registry)
                if line:
                    clauses.append(f"    {line}")

    # Rules
    for i, r in enumerate(ir.get("rules", [])):
        if not isinstance(r, dict):
            continue
        rule_name = registry.get(r.get("id") or f"rule_{i + 1}")
        cond_strs = []
        for c in r.get("conditions", []):
            cstr = render_condition(c, objects_by_id, registry)
            if cstr:
                cond_strs.append(cstr)
        if not cond_strs:
            continue
        cond_line = " and ".join(cond_strs)
        cons = r.get("consequence", {})
        cons_line = render_consequence(cons, objects_by_id, acts_by_id, registry)
        if not cons_line:
            continue
        clauses.append(f"    rule {rule_name}")
        clauses.append(f"        If {cond_line}")
        clauses.append(f"        then {cons_line}")
        valid_from = r.get("valid_from")
        valid_to = r.get("valid_to")
        if valid_from:
            if valid_to:
                clauses.append(f"        valid from {valid_from} to {valid_to}")
            else:
                clauses.append(f"        valid from {valid_from}")

    # Procedures
    for proc in ir.get("procedures", []):
        if not isinstance(proc, dict) or not proc.get("name"):
            continue
        name = registry.get(proc["name"])
        steps = []
        for step in proc.get("steps", []):
            if not isinstance(step, dict):
                continue
            act = step.get("act")
            ref = step.get("ref")
            if isinstance(act, dict):
                act_ref = act.get("ref")
                if act_ref and act_ref in acts_by_id:
                    act = acts_by_id[act_ref]
                phrase = _render_action_phrase(act, objects_by_id, registry)
                if phrase:
                    steps.append(phrase)
            elif ref and ref in acts_by_id:
                phrase = _render_action_phrase(acts_by_id[ref], objects_by_id, registry)
                if phrase:
                    steps.append(phrase)
            elif "description" in step:
                desc = step["description"]
                if _looks_like_action_phrase(desc):
                    steps.append(desc if desc.endswith(".") else f"{desc}.")
        if steps:
            clauses.append(f"    procedure {name}:")
            for s in steps:
                clauses.append(f"        {s}")

    return clauses


def _looks_like_action_phrase(desc: str) -> bool:
    """Heuristic: does description look like 'Actor verb Object to Target'?"""
    if not desc or len(desc) < 10:
        return False
    words = desc.split()
    if len(words) < 3:
        return False
    return words[0][0].isupper() and any(
        w in ("pays", "transfer", "transfers", "provide", "provides", "pay")
        for w in words
    )


def render_articles(
    ir: dict,
    objects_by_id: dict[str, str],
    acts_by_id: dict[str, dict],
    registry: NameRegistry,
) -> list[str]:
    """Render single default article with all clauses."""
    clauses = render_article_clauses(ir, objects_by_id, acts_by_id, registry)
    if not clauses:
        return []
    lines = ["article 1 Generated"]
    lines.extend(clauses)
    return lines


def render_scenarios(ir: dict) -> list[str]:
    """Render scenarios. Parser expects: scenario Name: then at YYYY-MM-DD with assertions."""
    lines = []
    for sc in ir.get("scenarios", []):
        if not isinstance(sc, dict) or not sc.get("name"):
            continue
        name = sc.get("name", "")
        lines.append(f"scenario {name}:")
        for evt in sc.get("timeline", []):
            if isinstance(evt, dict):
                date_str = evt.get("event", evt.get("date", ""))
                if date_str and _is_date_like(date_str):
                    lines.append(f"    at {date_str}")
                    for assertion in evt.get("assertions", []):
                        if isinstance(assertion, dict) and assertion.get("type") == "act":
                            act_body = assertion.get("body", "")
                            if act_body:
                                lines.append(f"        act {act_body}")
                elif date_str:
                    lines.append(f"    at {date_str}")
        if lines and not any(line.startswith("    at") for line in lines[1:]):
            lines.append("    at 2024-01-01")
    return lines


def _is_date_like(s: str) -> bool:
    """Check if string looks like YYYY-MM-DD."""
    parts = str(s).strip().split("-")
    return len(parts) == 3 and all(p.isdigit() for p in parts)


def _build_registry(ir: dict) -> NameRegistry:
    """Build NameRegistry with all identifiers from IR. Ensures consistent canonical forms."""
    registry = NameRegistry()
    for p in ir.get("parties", []):
        if isinstance(p, dict) and p.get("id"):
            registry.get(p["id"])
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
            registry.get(o["id"])
    for f in ir.get("facts", []):
        if isinstance(f, dict) and f.get("name"):
            registry.get(f["name"])
            if f.get("subject"):
                registry.get(f["subject"])
            if f.get("object"):
                registry.get(f["object"])
    for a in ir.get("acts", []):
        if isinstance(a, dict):
            for key in ("actor", "object", "target"):
                if a.get(key):
                    registry.get(a[key])
    for r in ir.get("rules", []):
        if isinstance(r, dict):
            registry.get(r.get("id") or "rule")
            for c in r.get("conditions", []):
                if isinstance(c, dict):
                    for key in ("name", "subject", "object", "actor", "target"):
                        if c.get(key):
                            registry.get(c[key])
                    act = c.get("act")
                    if isinstance(act, dict):
                        for key in ("actor", "object", "target"):
                            if act.get(key):
                                registry.get(act[key])
            cons = r.get("consequence", {})
            if isinstance(cons, dict) and "act" in cons:
                act = cons["act"]
                if isinstance(act, dict):
                    for key in ("actor", "object", "target"):
                        if act.get(key):
                            registry.get(act[key])
    for proc in ir.get("procedures", []):
        if isinstance(proc, dict) and proc.get("name"):
            registry.get(proc["name"])
    return registry


def render_ir(ir: dict) -> str:
    """
    Render full IR to DSL text conforming to Parser.hs grammar.

    Emits: header, vocabulary (verbs only), parties, objects, article 1 with clauses, scenarios.
    Uses NameRegistry for canonical identifiers throughout.
    """
    sections = []
    objects_by_id = _build_objects_by_id(ir)
    acts_by_id = _build_acts_by_id(ir)
    registry = _build_registry(ir)

    header = render_header(ir)
    if header:
        sections.append("\n".join(header))

    vocab = render_vocabulary(ir, objects_by_id)
    if len(vocab) > 1:
        sections.append("\n".join(vocab))

    parties = render_parties(ir, registry)
    if len(parties) > 1:
        sections.append("\n".join(parties))

    objects = render_objects(ir, registry)
    if len(objects) > 1:
        sections.append("\n".join(objects))

    articles = render_articles(ir, objects_by_id, acts_by_id, registry)
    if articles:
        sections.append("\n".join(articles))

    scenarios = render_scenarios(ir)
    if scenarios:
        sections.append("\n".join(scenarios).rstrip())

    return "\n\n".join(sections) if sections else ""
