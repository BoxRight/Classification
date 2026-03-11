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
            parts.append(f"{t}:{n}:{a}:{o}:{tg}:{ref}")
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
    if ctype in ("?", "simple") and not name:
        return True
    if ctype == "simple" and not cond.get("actor") and not cond.get("object"):
        return True
    return False


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

    # 4. Normalize object identifiers
    for o in ir.get("objects", []):
        if isinstance(o, dict) and o.get("id"):
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

    # 6. Normalize identifiers in acts, norms, and rules
    objects_by_id = _build_objects_by_id(ir)
    for a in ir.get("acts", []):
        if isinstance(a, dict):
            for key in ("actor", "object", "target"):
                if a.get(key):
                    if key == "object":
                        a[key] = _normalize_identifier(a[key], "objects", dictionary)
                    else:
                        a[key] = _normalize_identifier(a[key], "roles", dictionary)
    for n in ir.get("norms", []):
        if isinstance(n, dict):
            act = n.get("act", {})
            if isinstance(act, dict):
                for key in ("actor", "object", "target"):
                    if act.get(key):
                        if key == "object":
                            act[key] = _normalize_identifier(act[key], "objects", dictionary)
                        else:
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
        for c in conds:
            if isinstance(c, dict) and c.get("actor"):
                c["actor"] = _normalize_identifier(c["actor"], "roles", dictionary)
            if isinstance(c, dict) and c.get("target"):
                c["target"] = _normalize_identifier(c["target"], "roles", dictionary)
            if isinstance(c, dict) and c.get("object"):
                c["object"] = _normalize_identifier(c["object"], "objects", dictionary)
        cons = r.get("consequence", {})
        if isinstance(cons, dict) and "act" in cons:
            act = cons["act"]
            if isinstance(act, dict):
                for key in ("actor", "object", "target"):
                    if act.get(key):
                        if key == "object":
                            act[key] = _normalize_identifier(act[key], "objects", dictionary)
                        else:
                            act[key] = _normalize_identifier(act[key], "roles", dictionary)
        rules.append(r)
    ir["rules"] = rules

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

    return ir
