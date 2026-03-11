"""
Stage 5: DSL reconstruction.

Renders IR to DSL text.
"""

from typing import Any


def _to_pascal(s: str) -> str:
    """Convert snake_case to PascalCase."""
    return "".join(w.capitalize() for w in s.split("_"))


def _render_act(act: dict) -> str:
    """Render act triple to DSL fragment."""
    actor = _to_pascal(act.get("actor", ""))
    obj = _to_pascal(act.get("object", ""))
    target = _to_pascal(act.get("target", ""))
    verb = act.get("verb", "transfer")
    if not actor or not obj:
        return ""
    if target:
        return f"{actor} must {verb} {obj} to {target}"
    return f"{actor} must {verb} {obj}"


def render_dsl(ir: dict[str, Any]) -> str:
    """
    Render IR to DSL text.

    Maps modalities to DSL syntax:
    - obligation -> obligation X must pay Y to Z.
    - claim -> claim X may demand Y from Z.
    - prohibition -> prohibition X must not verb Y.
    - privilege -> privilege X may verb Y to Z.
    """
    lines = []

    # Norms
    for n in ir.get("norms", []):
        modality = n.get("modality", "")
        act = n.get("act", {})
        actor = _to_pascal(act.get("actor", ""))
        obj = _to_pascal(act.get("object", ""))
        target = _to_pascal(act.get("target", ""))
        act_type = act.get("type", "simple")
        verb = "fail" if act_type == "counter" else "pay"

        if modality == "obligation":
            if target:
                lines.append(f"obligation {actor} must {verb} {obj} to {target}.")
            else:
                lines.append(f"obligation {actor} must {verb} {obj}.")
        elif modality == "claim":
            if target:
                lines.append(f"claim {actor} may demand {obj} from {target}.")
            else:
                lines.append(f"claim {actor} may demand {obj}.")
        elif modality == "prohibition":
            lines.append(f"prohibition {actor} must not {verb} {obj}.")
        elif modality == "privilege":
            if target:
                lines.append(f"privilege {actor} may {verb} {obj} to {target}.")
            else:
                lines.append(f"privilege {actor} may {verb} {obj}.")

    # Rules
    for r in ir.get("rules", []):
        conds = r.get("conditions", [])
        cons = r.get("consequence", {})
        cond_strs = []
        for c in conds:
            if isinstance(c, dict):
                t = c.get("type", "?")
                n = c.get("name", "")
                cond_strs.append(f"{t}:{n}" if n else t)
        cond_line = " AND ".join(cond_strs) if cond_strs else "?"
        mod = cons.get("modality", "?")
        act = cons.get("act", {})
        if isinstance(act, dict):
            a = _to_pascal(act.get("actor", ""))
            o = _to_pascal(act.get("object", ""))
            t = _to_pascal(act.get("target", ""))
            cons_line = f"{mod}({a} -> {o} -> {t})"
        else:
            cons_line = str(cons)
        lines.append(f"rule IF {cond_line} THEN {cons_line}.")

    # Facts
    for f in ir.get("facts", []):
        if isinstance(f, dict):
            ftype = f.get("type", "")
            name = f.get("name", "")
            if name:
                lines.append(f"fact {ftype} {name}.")

    return "\n".join(lines) if lines else ""
