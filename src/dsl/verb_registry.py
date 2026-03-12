"""
Canonical verb registry shared by sanitizer and renderer.

Loads verbs from normalization/dictionary.json to prevent drift between
IR agent output and renderer output.
"""

from pathlib import Path

PROJECT_ROOT = Path(__file__).resolve().parent.parent.parent

# Core verbs inferred from object types (always available)
OBJECT_TYPE_VERBS = {
    "money": "pay",
    "nonmovable": "transfer",
    "movable": "transfer",
    "service": "provide",
}

# Fallback when object not in objects
DEFAULT_VERB = "transfer"

# Event act verbs (from concept map / EVENT_VERB_MAP)
EVENT_VERBS = {"cancel", "notify", "cause", "file"}

# Harm verbs: counter-act correction applies when condition uses these + compensatory consequence
HARM_VERBS = {"damage", "cause"}


def load_canonical_verbs(dictionary: dict | None = None) -> set[str]:
    """
    Load canonical verbs from dictionary.

    Returns set of verb strings that are valid for vocabulary.
    """
    if dictionary is None:
        path = PROJECT_ROOT / "normalization" / "dictionary.json"
        if not path.exists():
            return set()
        import json
        dictionary = json.loads(path.read_text(encoding="utf-8"))
    verbs = dictionary.get("verbs", {})
    if not isinstance(verbs, dict):
        return set()
    canonical = set(verbs.values())
    # Ensure core verbs always present
    canonical.update(OBJECT_TYPE_VERBS.values())
    canonical.update(EVENT_VERBS)
    canonical.add("perform")  # Fallback for unknown acts
    canonical.add("sublease")
    canonical.add("damage")
    return canonical


def normalize_verb(surface: str, dictionary: dict | None = None) -> str:
    """
    Map surface form to canonical verb.

    If surface not in dictionary, returns as-is if it's in canonical set.
    """
    canonical = load_canonical_verbs(dictionary)
    if not surface:
        return DEFAULT_VERB
    key = surface.lower().strip()
    if dictionary:
        verbs = dictionary.get("verbs", {})
        if isinstance(verbs, dict) and key in verbs:
            return verbs[key]
    if key in canonical:
        return key
    return surface if surface in canonical else DEFAULT_VERB


def get_verb_for_object_type(obj_type: str) -> str:
    """Get canonical verb for object type (money->pay, nonmovable->transfer, etc.)."""
    return OBJECT_TYPE_VERBS.get(obj_type, DEFAULT_VERB)
