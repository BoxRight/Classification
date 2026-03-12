"""
Compound concept decomposition: split identifiers into (verb, object) when verb is canonical.

Only applies when the first token matches the canonical verb registry.
Object resolution should try both the decomposed object and the original identifier.
"""


def decompose(obj_id: str, canonical_verbs: set[str]) -> tuple[str, str] | None:
    """
    Decompose compound identifier into (verb, object) if first token is a canonical verb.

    For identifiers containing '_', split: first token = verb, remaining = object.
    Returns None if first token is not in canonical_verbs.

    Examples:
        damage_property -> (damage, property)  when damage in registry
        cancel_event -> (cancel, event)
        breach_obligation -> None  (breach not in registry)
    """
    if not obj_id or "_" not in obj_id:
        return None
    key = obj_id.lower().strip().replace("-", "_")
    parts = key.split("_")
    if not parts:
        return None
    verb = parts[0]
    if verb not in canonical_verbs:
        return None
    object_token = "_".join(parts[1:])
    if not object_token:
        return None
    return (verb, object_token)
