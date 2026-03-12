"""
IR sanitization pass.

Runs before DSL rendering to:
- Normalize law/title to canonical module identifier
- Normalize imports as comments
- Normalize party/object identifiers via dictionary
- Normalize fact declarations (type, name, subject)
- Remove rules with unresolved conditions
- Deduplicate rules by condition-consequence hash
- Ensure every rule has a name (id)
- Validate party/object references against ontology (log warnings)
- Resolve procedure step refs to acts when possible
- Collect verbs for vocabulary
- Normalization layer: object resolution (IR -> ontology -> concept map -> synthetic)
- Guarantor rule expansion (one rule per obligation)
"""

import hashlib
import json
import logging
from pathlib import Path
from typing import Any

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent
logger = logging.getLogger(__name__)


def _load_ontology() -> tuple[set[str], set[str]]:
    """Load valid role and object ids from ontology. Returns (role_ids, object_ids)."""
    role_ids = set()
    obj_ids = set()
    roles_path = PROJECT_ROOT / "ontology" / "roles.json"
    objects_path = PROJECT_ROOT / "ontology" / "objects.json"
    if roles_path.exists():
        data = json.loads(roles_path.read_text(encoding="utf-8"))
        canonical = data.get("canonical", [])
        role_ids = {r if isinstance(r, str) else r.get("id", "") for r in canonical}
    if objects_path.exists():
        data = json.loads(objects_path.read_text(encoding="utf-8"))
        canonical = data.get("canonical", [])
        for item in canonical:
            if isinstance(item, dict) and item.get("id"):
                obj_ids.add(item["id"])
            elif isinstance(item, str):
                obj_ids.add(item)
    return role_ids, obj_ids


def _load_ontology_objects_with_types() -> dict[str, str]:
    """Load object id -> type from ontology."""
    path = PROJECT_ROOT / "ontology" / "objects.json"
    if not path.exists():
        return {}
    data = json.loads(path.read_text(encoding="utf-8"))
    canonical = data.get("canonical", [])
    result = {}
    for item in canonical:
        if isinstance(item, dict) and item.get("id"):
            result[item["id"]] = item.get("type", "nonmovable")
    return result


def _load_dictionary() -> dict:
    """Load normalization dictionary."""
    path = PROJECT_ROOT / "normalization" / "dictionary.json"
    if not path.exists():
        return {}
    return json.loads(path.read_text(encoding="utf-8"))


def _normalize_law(law: str, dictionary: dict) -> str:
    """Map law title to canonical module identifier."""
    if not law:
        return "Unknown"
    titles = dictionary.get("law_titles", {})
    key = law.lower().strip()
    if key in titles:
        return titles[key]
    # Try phrase match (e.g. "Contrato de Arrendamiento" -> "contrato de arrendamiento")
    for k, v in titles.items():
        if k in key:
            return v
    # Return PascalCase of first significant words
    words = [w for w in key.replace("-", " ").split() if len(w) > 2]
    if words:
        return "".join(w.capitalize() for w in words[:3])
    return law


def _to_snake(s: str) -> str:
    """Convert PascalCase/camelCase to snake_case for consistent identifier storage."""
    if not s:
        return s
    import re
    s = str(s).strip()
    result = re.sub(r"(?<=[a-z0-9])([A-Z])", r"_\1", s)
    return result.lower().replace("-", "_").replace(" ", "_")


def _normalize_identifier(ident: str, section: str, dictionary: dict) -> str:
    """Map identifier to canonical form using dictionary."""
    if not ident:
        return ident
    section_map = dictionary.get(section, {})
    key = ident.lower().strip()
    return section_map.get(key, ident)


def _rule_signature(rule: dict, objects_by_id: dict) -> str:
    """Hash rule for deduplication."""
    conds = rule.get("conditions", [])
    cons = rule.get("consequence", {})
    parts = []
    for c in conds:
        if isinstance(c, dict):
            t = c.get("type", "")
            n = c.get("name", "")
            a = c.get("actor", "")
            o = c.get("object", "")
            tg = c.get("target", "")
            ref = c.get("ref", "")
            part = f"{t}:{n}:{a}:{o}:{tg}:{ref}"
            if t == "intrinsic":
                part += ":" + "|".join(str(x) for x in c.get("args", []))
                if c.get("operator") is not None:
                    part += ":" + str(c.get("operator"))
                if c.get("value") is not None:
                    part += ":" + str(c.get("value"))
            parts.append(part)
    if isinstance(cons, dict):
        if "modality" in cons:
            act = cons.get("act", {})
            if isinstance(act, dict):
                parts.append(f"mod:{cons['modality']}:{act.get('actor')}:{act.get('object')}:{act.get('target')}")
        elif "type" in cons and "name" in cons:
            parts.append(f"fact:{cons['type']}:{cons['name']}")
    return hashlib.sha256("|".join(parts).encode()).hexdigest()


def _is_unresolved_condition(cond: dict) -> bool:
    """Check if condition is unresolved (e.g. only type 'simple' or '?')."""
    if not isinstance(cond, dict):
        return True
    ctype = cond.get("type", "?")
    name = cond.get("name", "")
    # Simple with actor/object is resolved
    if ctype == "simple" and (cond.get("actor") or cond.get("object")):
        return False
    # Intrinsic conditions are resolved
    if ctype == "intrinsic":
        return False
    if ctype in ("?", "simple") and not name:
        return True
    if ctype == "simple" and not cond.get("actor") and not cond.get("object"):
        return True
    return False


def _apply_rule_heuristics(ir: dict) -> None:
    """
    Post-process rules to fix common extraction errors:
    - Force majeure: when condition and consequence describe the same act, replace with ForceMajeureEvent.
    - Percentage penalty: when late cancellation rule uses penalty_amount, replace with percentage of advance_payment.
    """
    rules = ir.get("rules", [])
    facts = ir.setdefault("facts", [])

    for r in rules:
        if not isinstance(r, dict):
            continue
        rid = (r.get("id") or "").lower()
        conditions = r.get("conditions", [])
        consequence = r.get("consequence", {})

        # Force majeure hallucination fix: LLM often produces vacuous rules (condition and consequence
        # describe the same act) or uses unmapped objects (force_majeure, reschedule_event). Replace
        # with correct exception pattern: ForceMajeureEvent → may refrain from transfer.
        if "force_majeure" in rid and isinstance(consequence, dict):
            cons_act = consequence.get("act")
            if isinstance(cons_act, dict) and consequence.get("modality") == "privilege":
                # Detect vacuous or confused structure: condition has simple act with same actor as consequence
                cond_has_simple_act = any(
                    isinstance(c, dict) and c.get("type") == "simple" and c.get("actor") and c.get("object")
                    for c in conditions
                )
                # Also fix when condition act matches consequence act (exact match after normalization)
                cond_act = next(
                    (c for c in conditions if isinstance(c, dict) and c.get("type") == "simple" and c.get("actor") and c.get("object")),
                    None,
                )
                is_vacuous = cond_act and (
                    cond_act.get("actor") == cons_act.get("actor")
                    and cond_act.get("object") == cons_act.get("object")
                )
                if cond_has_simple_act or is_vacuous:
                    # Replace condition with ForceMajeureEvent
                    r["conditions"] = [{"type": "asset", "name": "ForceMajeureEvent"}]
                    consequence["refrain"] = True
                    # Ensure ForceMajeureEvent is in facts
                    fact_names = {_to_snake(f.get("name", "")) for f in facts if isinstance(f, dict) and f.get("name")}
                    if "force_majeure_event" not in fact_names:
                        facts.append({"type": "asset", "name": "ForceMajeureEvent", "subject": None})

        # Percentage penalty heuristic (late cancellation: daysBetween < 30 → 50% of advance)
        if "cancellation" in rid and "notice" in rid and isinstance(consequence, dict):
            cons_act = consequence.get("act")
            if isinstance(cons_act, dict) and cons_act.get("object", "").lower() in (
                "penalty_amount",
                "penaltyamount",
            ):
                has_days_between_lt = False
                for c in conditions:
                    if (
                        isinstance(c, dict)
                        and c.get("type") == "intrinsic"
                        and c.get("name") == "daysBetween"
                    ):
                        op = (c.get("operator") or "").strip().lower()
                        if op in ("<", "lt", "lte", "<="):
                            has_days_between_lt = True
                            break
                if has_days_between_lt:
                    cons_act["object"] = "advance_payment"
                    cons_act["amount"] = {
                        "type": "intrinsic",
                        "name": "percentage",
                        "args": ["advance_payment", 50],
                    }


def _build_objects_by_id(ir: dict) -> dict[str, str]:
    """Build id -> type mapping."""
    by_id = {}
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
            by_id[o["id"]] = o.get("type", "nonmovable")
    return by_id


def _infer_verb(obj_type: str) -> str:
    """Infer verb from object type."""
    if obj_type == "money":
        return "pay"
    if obj_type in ("nonmovable", "movable"):
        return "transfer"
    if obj_type == "service":
        return "provide"
    return "transfer"


def sanitize_ir(ir: dict, dictionary_path: Path | None = None) -> dict:
    """
    Sanitize IR for deterministic DSL rendering.

    Returns sanitized IR (copy). Does not mutate input.
    """
    import copy
    ir = copy.deepcopy(ir)

    # Skip metadata
    for key in ("_source", "_unresolved"):
        ir.pop(key, None)

    dictionary = _load_dictionary() if dictionary_path is None else json.loads(dictionary_path.read_text(encoding="utf-8"))

    # 1. Normalize law to canonical module identifier
    law = ir.get("law") or ""
    ir["law"] = _normalize_law(law, dictionary)
    if law and ir["law"] != law:
        ir["_original_law"] = law

    # 2. Normalize imports as comments (structured)
    imports = ir.get("imports") or []
    if imports and isinstance(imports[0], str):
        ir["imports"] = [f"/* {imp} */" for imp in imports]

    # 3. Normalize party identifiers
    for p in ir.get("parties", []):
        if isinstance(p, dict) and p.get("id"):
            p["id"] = _normalize_identifier(p["id"], "roles", dictionary)

    # 4. Normalize object identifiers (skip abstract ones: subleasing, damage_property, breach_obligation, tenant_obligations - handled by concept map)
    _skip_object_norm = {"subleasing", "damage_property", "breach_obligation", "tenant_obligations"}
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
            key = o["id"].lower().replace("-", "_")
            if key not in _skip_object_norm:
                o["id"] = _normalize_identifier(o["id"], "objects", dictionary)

    # 5. Normalize facts (ensure type, name, subject; canonicalize name to snake_case)
    facts = []
    institutions = dictionary.get("institutions", {})
    for f in ir.get("facts", []):
        if isinstance(f, dict) and f.get("name"):
            ftype = f.get("type", "asset")
            name = f.get("name", "")
            subject = f.get("subject")
            if name:
                key = name.lower().replace(" ", "_")
                fname = institutions.get(key, name)
                fname = _to_snake(fname) if fname else name
                if subject:
                    subject = _normalize_identifier(subject, "roles", dictionary)
                facts.append({"type": ftype, "name": fname, "subject": subject})
    ir["facts"] = facts

    # 6. Normalize identifiers in acts, norms, and rules (skip abstract objects for concept map)
    objects_by_id = _build_objects_by_id(ir)
    for a in ir.get("acts", []):
        if isinstance(a, dict):
            for key in ("actor", "object", "target"):
                if a.get(key):
                    if key == "object" and a[key].lower().replace("-", "_") not in _skip_object_norm:
                        a[key] = _normalize_identifier(a[key], "objects", dictionary)
                    elif key != "object":
                        a[key] = _normalize_identifier(a[key], "roles", dictionary)
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            act = n.get("act", {})
            if isinstance(act, dict):
                for key in ("actor", "object", "target"):
                    if act.get(key):
                        if key == "object" and act[key].lower().replace("-", "_") not in _skip_object_norm:
                            act[key] = _normalize_identifier(act[key], "objects", dictionary)
                        elif key != "object":
                            act[key] = _normalize_identifier(act[key], "roles", dictionary)

    # 7. Remove rules with unresolved conditions, deduplicate, ensure rule names
    rules = []
    seen = set()
    for i, r in enumerate(ir.get("rules", [])):
        if not isinstance(r, dict):
            continue
        conds = r.get("conditions", [])
        if any(_is_unresolved_condition(c) for c in conds):
            continue
        sig = _rule_signature(r, objects_by_id)
        if sig in seen:
            continue
        seen.add(sig)
        if not r.get("id"):
            r["id"] = f"rule_{len(rules) + 1}"
        # Normalize identifiers in rule
        known_objects = {o.get("id", "").lower().replace("-", "_") for o in ir.get("objects", []) if isinstance(o, dict) and o.get("id")}
        known_parties = {p.get("id", "").lower().replace("-", "_") for p in ir.get("parties", []) if isinstance(p, dict) and p.get("id")}
        for c in conds:
            if isinstance(c, dict) and c.get("actor"):
                c["actor"] = _normalize_identifier(c["actor"], "roles", dictionary)
            if isinstance(c, dict) and c.get("target"):
                c["target"] = _normalize_identifier(c["target"], "roles", dictionary)
            if isinstance(c, dict) and c.get("object") and c["object"].lower().replace("-", "_") not in _skip_object_norm:
                c["object"] = _normalize_identifier(c["object"], "objects", dictionary)
            act = c.get("act") if isinstance(c, dict) else None
            if isinstance(act, dict) and act.get("object") and act["object"].lower().replace("-", "_") not in _skip_object_norm:
                act["object"] = _normalize_identifier(act["object"], "objects", dictionary)
            if isinstance(c, dict) and c.get("type") == "intrinsic":
                from src.dsl.concept_map import INTRINSIC_ARG_ALIASES

                new_args = []
                for arg in c.get("args", []):
                    if isinstance(arg, (int, float)):
                        new_args.append(arg)
                    elif isinstance(arg, str) and arg.replace("_", "").isalnum() and "-" not in arg:
                        key = arg.lower().replace("-", "_")
                        resolved = None
                        if key in known_objects:
                            resolved = _normalize_identifier(arg, "objects", dictionary)
                        elif key in known_parties:
                            resolved = _normalize_identifier(arg, "roles", dictionary)
                        elif key in INTRINSIC_ARG_ALIASES:
                            canonical = INTRINSIC_ARG_ALIASES[key]
                            resolved = _normalize_identifier(canonical, "objects", dictionary)
                        if resolved is not None:
                            new_args.append(resolved)
                        else:
                            new_args.append(arg)
                    else:
                        new_args.append(arg)
                c["args"] = new_args
                # Migrate legacy daysBetween (args with trailing number) to operator/value format
                if (
                    c.get("name") == "daysBetween"
                    and c.get("operator") is None
                    and c.get("value") is None
                    and len(new_args) >= 3
                    and isinstance(new_args[-1], (int, float))
                    and new_args[-1] > 0
                ):
                    c["value"] = new_args.pop()
                    c["operator"] = "<"  # Penalty rules: insufficient notice
                # Replace "daysBetween ... 0" (no notice) with negated notify condition
                elif (
                    c.get("name") == "daysBetween"
                    and (
                        (len(new_args) >= 3 and new_args[-1] == 0)
                        or c.get("value") == 0
                    )
                ):
                    # "No notice" = absence of notification, not equality to zero
                    idx = conds.index(c)
                    conds[idx] = {
                        "type": "intrinsic",
                        "name": "not",
                        "args": [
                            {
                                "type": "simple",
                                "actor": "tenant",
                                "object": "cancellation_notice",
                                "target": "landlord",
                                "_verb": "notify",
                            }
                        ],
                    }
        cons = r.get("consequence", {})
        if isinstance(cons, dict) and "act" in cons:
            act = cons["act"]
            if isinstance(act, dict):
                for key in ("actor", "object", "target"):
                    if act.get(key):
                        if key == "object" and act[key].lower().replace("-", "_") not in _skip_object_norm:
                            act[key] = _normalize_identifier(act[key], "objects", dictionary)
                        elif key != "object":
                            act[key] = _normalize_identifier(act[key], "roles", dictionary)
        rules.append(r)
    ir["rules"] = rules

    # 7.5. Post-process rules: force majeure hallucination fix, percentage penalty heuristic
    _apply_rule_heuristics(ir)

    # 8. Collect verbs for vocabulary
    verbs_used = set()
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            act = n.get("act", {})
            if isinstance(act, dict):
                obj_id = act.get("object", "")
                obj_type = objects_by_id.get(obj_id, "nonmovable")
                verbs_used.add(_infer_verb(obj_type))
    for r in ir.get("rules", []):
        if isinstance(r, dict):
            cons = r.get("consequence", {})
            if isinstance(cons, dict) and "act" in cons:
                act = cons["act"]
                if isinstance(act, dict):
                    obj_id = act.get("object", "")
                    obj_type = objects_by_id.get(obj_id, "nonmovable")
                    verbs_used.add(_infer_verb(obj_type))
    ir["_verbs"] = sorted(verbs_used)

    # 9. Ontology validation (log warnings for unknown refs)
    role_ids, obj_ids = _load_ontology()
    if role_ids or obj_ids:
        for p in ir.get("parties", []):
            if isinstance(p, dict) and p.get("id"):
                pid = p["id"].lower().replace("-", "_")
                if pid not in role_ids and role_ids:
                    logger.debug("Party %r not in ontology", p["id"])
        for o in ir.get("objects", []):
            if isinstance(o, dict) and o.get("id"):
                oid = o["id"].lower().replace("-", "_")
                if oid not in obj_ids and obj_ids:
                    logger.debug("Object %r not in ontology", o["id"])

    # 10. Resolve procedure step refs (add _resolved_act for renderer convenience)
    acts_by_id = {a["id"]: a for a in ir.get("acts", []) if isinstance(a, dict) and a.get("id")}
    for proc in ir.get("procedures", []):
        if isinstance(proc, dict):
            for step in proc.get("steps", []):
                if isinstance(step, dict):
                    ref = step.get("ref") or (step.get("act", {}) or {}).get("ref") if isinstance(step.get("act"), dict) else None
                    if ref and ref in acts_by_id:
                        step["_resolved_act"] = acts_by_id[ref]

    # 11. Ontology-driven normalization: decomposition → object resolution → counter-act correction
    ir = _normalize_ir_objects(ir, dictionary)

    # 12. Counter-act correction (rules only: harm verb + compensatory consequence)
    ir = _apply_counter_act_correction(ir)

    # 13. Guarantor rule expansion (after normalization; looks for breach_obligation)
    ir = _expand_guarantor_rules(ir)

    # 14. Unused object pruning (after guarantor expansion; before verb collection)
    ir = _prune_unused_objects(ir)

    # 15. Collect verbs from canonical registry (decomposition + dictionary + perform fallback)
    from src.dsl.verb_registry import load_canonical_verbs
    from src.dsl.decomposition import decompose

    canonical_verbs = load_canonical_verbs(dictionary)
    ontology = _load_ontology_objects_with_types()
    objects_by_id = _build_objects_by_id(ir)
    verbs_used = set()

    def _add_verb_for_act(act: dict, for_counter: bool = False) -> None:
        if not isinstance(act, dict):
            return
        if act.get("_verb"):
            verbs_used.add(act["_verb"])
            return
        obj_id = act.get("object", "")
        if for_counter:
            decomp = decompose(obj_id, canonical_verbs)
            verbs_used.add(decomp[0] if decomp else "pay")
        elif obj_id in objects_by_id:
            verbs_used.add(_infer_verb(objects_by_id[obj_id]))
        else:
            decomp = decompose(obj_id, canonical_verbs)
            if decomp:
                verbs_used.add(decomp[0])
            elif obj_id in ontology or obj_id in {"event", "cancellation_notice"}:
                obj_type = ontology.get(obj_id, "service")
                verbs_used.add(_infer_verb(obj_type))
            else:
                verbs_used.add("perform")

    for n in ir.get("norms", []):
        if isinstance(n, dict):
            _add_verb_for_act(n.get("act", {}))
    for r in ir.get("rules", []):
        if isinstance(r, dict):
            for c in r.get("conditions", []):
                if isinstance(c, dict) and c.get("type") == "counter":
                    _add_verb_for_act(c, for_counter=True)
                elif isinstance(c, dict) and "act" in c:
                    _add_verb_for_act(c.get("act", {}), for_counter=c.get("type") == "counter")
                elif isinstance(c, dict) and c.get("type") == "intrinsic" and c.get("name") == "not":
                    for arg in c.get("args", []):
                        if isinstance(arg, dict) and (arg.get("type") == "counter" or "object" in arg):
                            _add_verb_for_act(arg, for_counter=True)
            cons = r.get("consequence", {})
            if isinstance(cons, dict) and "act" in cons:
                _add_verb_for_act(cons["act"])
    for a in ir.get("acts", []):
        _add_verb_for_act(a)

    ir["_verbs"] = sorted(verbs_used)

    return ir


def _collect_referenced_object_ids(ir: dict) -> set[str]:
    """Collect all object ids referenced in acts, norms, rules, procedures."""
    ids = set()
    for a in ir.get("acts", []):
        if isinstance(a, dict) and a.get("object"):
            ids.add(a["object"])
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            act = n.get("act", {})
            if isinstance(act, dict) and act.get("object"):
                ids.add(act["object"])
    for r in ir.get("rules", []):
        if isinstance(r, dict):
            for c in r.get("conditions", []):
                if isinstance(c, dict) and c.get("object"):
                    ids.add(c["object"])
                act = c.get("act") if isinstance(c, dict) else None
                if isinstance(act, dict) and act.get("object"):
                    ids.add(act["object"])
                if isinstance(c, dict) and c.get("type") == "intrinsic":
                    for arg in c.get("args", []):
                        if isinstance(arg, str):
                            if arg.replace("_", "").isalnum() and "-" not in arg:
                                ids.add(arg)
            cons = r.get("consequence", {})
            if isinstance(cons, dict) and "act" in cons:
                act = cons["act"]
                if isinstance(act, dict) and act.get("object"):
                    ids.add(act["object"])
    for proc in ir.get("procedures", []):
        if isinstance(proc, dict):
            for step in proc.get("steps", []):
                act = step.get("_resolved_act") or step.get("act") or (step.get("ref") and {})
                if isinstance(act, dict) and act.get("object"):
                    ids.add(act["object"])
                elif step.get("ref"):
                    for a in ir.get("acts", []):
                        if isinstance(a, dict) and a.get("id") == step["ref"] and a.get("object"):
                            ids.add(a["object"])
                            break
    return ids


def _resolve_object(
    obj_id: str,
    decomposed_object: str | None,
    objects_list: list[dict],
    objects_seen: set[str],
    ontology: dict[str, str],
    ir_object_ids: list[str],
    dictionary: dict,
) -> tuple[str | None, str, str | None]:
    """
    Resolve object id using deterministic order.
    Returns (resolved_id, resolved_type, verb_hint).
    Try original first, then decomposed object if decomposition yielded one.
    """
    from src.dsl.decomposition import decompose
    from src.dsl.concept_map import SYNTHETIC_MAP
    from src.dsl.verb_registry import load_canonical_verbs

    ontology_ids = set(ontology)
    canonical_verbs = load_canonical_verbs(dictionary)

    def _try_resolve(candidate: str) -> tuple[str | None, str]:
        if not candidate:
            return None, "nonmovable"
        key = candidate.lower().replace("-", "_")
        # 1. Exact match in IR objects
        if key in objects_seen:
            return key, ontology.get(key, "nonmovable")
        # 2. Exact match in ontology
        if key in ontology_ids:
            return key, ontology.get(key, "nonmovable")
        # 3. IR object whose id contains the candidate token as substring
        for oid in ir_object_ids:
            if key in oid.lower():
                return oid, ontology.get(oid, "nonmovable")
        # 4. Synthetic (before type match to avoid wrong matches for event ids)
        if key in SYNTHETIC_MAP:
            return SYNTHETIC_MAP[key], "service"
        # 5. Ontology type match with IR object
        cand_type = ontology.get(key, "nonmovable")
        for oid in ir_object_ids:
            if ontology.get(oid, "nonmovable") == cand_type:
                return oid, cand_type
        for oid in ontology_ids:
            if ontology.get(oid, "nonmovable") == cand_type and oid in objects_seen:
                return oid, cand_type
        return None, "nonmovable"

    # Try original first
    resolved, rtype = _try_resolve(obj_id)
    verb_hint = None
    if resolved:
        decomp = decompose(obj_id, canonical_verbs)
        if decomp:
            verb_hint = decomp[0]
        return resolved, rtype, verb_hint

    # Try decomposed object
    if decomposed_object:
        resolved, rtype = _try_resolve(decomposed_object)
        if resolved:
            decomp = decompose(obj_id, canonical_verbs)
            if decomp:
                verb_hint = decomp[0]
            return resolved, rtype, verb_hint

    # Dictionary fallback
    key = obj_id.lower().replace("-", "_")
    if dictionary.get("objects", {}).get(key):
        resolved = dictionary["objects"][key]
        return resolved, ontology.get(resolved, "nonmovable"), None

    return None, "nonmovable", None


def _normalize_ir_objects(ir: dict, dictionary: dict) -> dict:
    """
    Ontology-driven normalization: decomposition + object resolution.
    Resolution tries both original and decomposed object.
    """
    from src.dsl.decomposition import decompose
    from src.dsl.verb_registry import load_canonical_verbs

    canonical_verbs = load_canonical_verbs(dictionary)
    objects_by_id = _build_objects_by_id(ir)
    ontology = _load_ontology_objects_with_types()
    refs = _collect_referenced_object_ids(ir)
    objects_list = list(ir.get("objects", []))
    objects_seen = {o["id"] for o in objects_list if isinstance(o, dict) and o.get("id")}
    ir_object_ids = list(objects_by_id.keys())

    # Skip replacement for guarantor expansion (handled later)
    _skip_replace = {"breach_obligation", "tenant_obligations"}

    for obj_id in refs:
        if obj_id in objects_seen:
            continue
        decomp = decompose(obj_id, canonical_verbs)
        decomposed_object = decomp[1] if decomp else None
        resolved_id, resolved_type, _ = _resolve_object(
            obj_id, decomposed_object, objects_list, objects_seen, ontology, ir_object_ids, dictionary
        )
        if resolved_id and resolved_id not in objects_seen:
            objects_list.append({"id": resolved_id, "type": resolved_type})
            objects_seen.add(resolved_id)
            ir_object_ids.append(resolved_id)

    from src.dsl.concept_map import VERB_HINTS

    def _replace_obj(oid: str) -> tuple[str, str | None]:
        if oid.lower().replace("-", "_") in _skip_replace:
            return oid, None
        if oid in objects_seen:
            decomp = decompose(oid, canonical_verbs)
            return oid, decomp[0] if decomp else VERB_HINTS.get(oid.lower().replace("-", "_"))
        decomp = decompose(oid, canonical_verbs)
        decomposed_object = decomp[1] if decomp else None
        resolved_id, _, verb_hint = _resolve_object(
            oid, decomposed_object, objects_list, objects_seen, ontology, ir_object_ids, dictionary
        )
        if resolved_id:
            return resolved_id, verb_hint or VERB_HINTS.get(oid.lower().replace("-", "_"))
        return oid, None

    for a in ir.get("acts", []):
        if isinstance(a, dict) and a.get("object"):
            new_obj, verb_hint = _replace_obj(a["object"])
            a["object"] = new_obj
            if verb_hint:
                a["_verb"] = verb_hint
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            act = n.get("act", {})
            if isinstance(act, dict) and act.get("object"):
                new_obj, verb_hint = _replace_obj(act["object"])
                act["object"] = new_obj
                if verb_hint:
                    act["_verb"] = verb_hint
    for r in ir.get("rules", []):
        if isinstance(r, dict):
            for c in r.get("conditions", []):
                if not isinstance(c, dict):
                    continue
                if c.get("object"):
                    new_obj, verb_hint = _replace_obj(c["object"])
                    c["object"] = new_obj
                    if verb_hint:
                        c["_verb"] = verb_hint
                act = c.get("act")
                if isinstance(act, dict) and act.get("object"):
                    new_obj, verb_hint = _replace_obj(act["object"])
                    act["object"] = new_obj
                    if verb_hint:
                        act["_verb"] = verb_hint
                if c.get("type") == "intrinsic" and c.get("name") == "not":
                    for arg in c.get("args", []):
                        if isinstance(arg, dict) and arg.get("object"):
                            new_obj, verb_hint = _replace_obj(arg["object"])
                            arg["object"] = new_obj
                            if verb_hint:
                                arg["_verb"] = verb_hint
            cons = r.get("consequence", {})
            if isinstance(cons, dict) and "act" in cons:
                act = cons["act"]
                if isinstance(act, dict) and act.get("object"):
                    new_obj, verb_hint = _replace_obj(act["object"])
                    act["object"] = new_obj
                    if verb_hint:
                        act["_verb"] = verb_hint

    ir["objects"] = objects_list
    return ir


def _apply_counter_act_correction(ir: dict) -> dict:
    """
    Convert counter-act to positive event when: harm verb + compensatory obligation.
    Applies only to rule conditions, never norms or procedures.
    """
    from src.dsl.decomposition import decompose
    from src.dsl.verb_registry import load_canonical_verbs, HARM_VERBS

    canonical_verbs = load_canonical_verbs()
    objects_by_id = _build_objects_by_id(ir)

    for r in ir.get("rules", []):
        if not isinstance(r, dict):
            continue
        cons = r.get("consequence", {})
        if not isinstance(cons, dict) or cons.get("modality") != "obligation":
            continue
        act = cons.get("act", {})
        if not isinstance(act, dict):
            continue
        cons_obj = act.get("object", "")
        cons_obj_type = objects_by_id.get(cons_obj, "")
        if cons_obj_type != "money":
            continue

        for c in r.get("conditions", []):
            if not isinstance(c, dict) or c.get("type") != "counter":
                continue
            obj_id = c.get("object", "")
            verb = c.get("_verb")
            if not verb:
                decomp = decompose(obj_id, canonical_verbs)
                if not decomp:
                    continue
                verb, _ = decomp
            if verb not in HARM_VERBS:
                continue
            c["type"] = "simple"
            if not c.get("_verb"):
                c["_verb"] = verb
            break

    return ir


def _prune_unused_objects(ir: dict) -> dict:
    """Remove objects not referenced in acts, norms, rules, procedures."""
    refs = _collect_referenced_object_ids(ir)
    objects = [o for o in ir.get("objects", []) if isinstance(o, dict) and o.get("id") and o["id"] in refs]
    ir["objects"] = objects
    return ir


def _expand_guarantor_rules(ir: dict) -> dict:
    """
    Expand guarantor rules with abstract tenant_obligations into concrete rules,
    one per primary obligation from norms only.

    Guarantor expansion derives from norms (primary contractual obligations),
    not from rule consequences (liabilities). This respects the structure:
    primary obligations -> breach -> liability rules.
    """
    objects_by_id = _build_objects_by_id(ir)
    tenant_payment_objects = [
        (n.get("act") or {}).get("object")
        for n in ir.get("norms", [])
        if isinstance(n, dict)
        and n.get("modality") == "obligation"
        and (n.get("act") or {}).get("actor", "").lower() == "tenant"
        and (n.get("act") or {}).get("object")
    ]
    tenant_payment_objects = list(dict.fromkeys(
        oid for oid in tenant_payment_objects
        if oid in objects_by_id and objects_by_id.get(oid) == "money"
    ))

    rules = []
    for r in ir.get("rules", []):
        if not isinstance(r, dict):
            rules.append(r)
            continue
        cons = r.get("consequence", {})
        act = cons.get("act", {}) if isinstance(cons, dict) else None
        conds = r.get("conditions", [])
        has_breach = any(
            isinstance(c, dict)
            and (str(c.get("object", "")).lower() in ("breach_obligation", "breach"))
            for c in conds
        )
        has_tenant_oblig = act and str(act.get("object", "")).lower() in ("tenant_obligations", "tenant_obligation")

        if has_breach and has_tenant_oblig:
            base_id = r.get("id", "guarantor_rule")
            asset_conds = [c for c in conds if isinstance(c, dict) and c.get("type") == "asset"]
            for i, obj_id in enumerate(tenant_payment_objects):
                new_rule = {
                    "id": f"{base_id}_{i}" if i else base_id,
                    "conditions": asset_conds + [
                        {"type": "counter", "actor": "tenant", "object": obj_id, "target": "landlord"},
                    ],
                    "consequence": {
                        "modality": "obligation",
                        "act": {"actor": "guarantor", "object": obj_id, "target": "landlord"},
                    },
                }
                if not any(c.get("name") == "GuaranteeActive" for c in asset_conds):
                    new_rule["conditions"].insert(0, {"type": "asset", "name": "GuaranteeActive"})
                rules.append(new_rule)
        else:
            rules.append(r)

    ir["rules"] = rules
    return ir
