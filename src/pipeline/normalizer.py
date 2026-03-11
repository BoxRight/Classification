"""
Stage 1: Normalization.

Tokenizes text and replaces terms with canonical identifiers using the dictionary.
"""

import json
import re
from pathlib import Path
from typing import Iterator


def _load_dictionary(path: Path) -> dict:
    """Load normalization dictionary."""
    data = json.loads(path.read_text(encoding="utf-8"))
    # Build flat mapping: source -> canonical (phrases first, then single words)
    mapping = {}
    # Phrases (longest first for correct replacement order)
    phrases = data.get("phrases", {})
    for k, v in phrases.items():
        mapping[k.lower().strip()] = v
    # Roles, objects, institutions
    for section in ("roles", "objects", "institutions"):
        for k, v in data.get(section, {}).items():
            mapping[k.lower().strip()] = v
    # Verbs
    for k, v in data.get("verbs", {}).items():
        mapping[k.lower().strip()] = v
    return mapping


def _split_clauses(text: str) -> list[str]:
    """Split text into clauses (sentences, numbered clauses)."""
    # Normalize whitespace
    text = re.sub(r"\s+", " ", text.strip())
    # Split on sentence boundaries and numbered clauses
    parts = re.split(r"(?<=[.;])\s+|\n+", text)
    clauses = []
    for p in parts:
        p = p.strip()
        if p:
            clauses.append(p)
    return clauses


def _longest_match_replace(text: str, mapping: dict) -> str:
    """Replace dictionary terms with canonical forms (longest match first)."""
    words = text.split()
    result = []
    i = 0
    while i < len(words):
        matched = False
        for length in range(min(5, len(words) - i), 0, -1):
            phrase = " ".join(words[i : i + length]).lower()
            if phrase in mapping:
                result.append(mapping[phrase])
                i += length
                matched = True
                break
        if not matched:
            word = words[i].lower()
            if word in mapping:
                result.append(mapping[word])
            else:
                result.append(words[i])
            i += 1
    return " ".join(result)


def normalize_text(
    text: str,
    dictionary_path: Path | None = None,
) -> str:
    """
    Normalize text using the dictionary.

    Replaces roles, objects, institutions, verbs, and phrases with canonical forms.
    """
    if dictionary_path is None:
        dictionary_path = Path(__file__).resolve().parent.parent.parent / "normalization" / "dictionary.json"
    mapping = _load_dictionary(dictionary_path)
    return _longest_match_replace(text, mapping)


def normalize_to_clauses(
    text: str,
    dictionary_path: Path | None = None,
) -> list[str]:
    """Normalize text and return as list of normalized clauses."""
    clauses = _split_clauses(text)
    if dictionary_path is None:
        dictionary_path = Path(__file__).resolve().parent.parent.parent / "normalization" / "dictionary.json"
    mapping = _load_dictionary(dictionary_path)
    return [_longest_match_replace(c, mapping) for c in clauses if c.strip()]
