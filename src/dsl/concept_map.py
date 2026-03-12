"""
Synthetic canonical objects for event acts.

Minimal table for ontology primitives (event, cancellation_notice).
No compound-concept mappings; use decomposition for those.
"""

# Deterministic synthetic objects (last resort, type service)
SYNTHETIC_OBJECTS = {"event", "cancellation_notice"}

# Map event-like identifiers to synthetic object (for resolution only)
SYNTHETIC_MAP: dict[str, str] = {
    "notify_cancellation": "cancellation_notice",
    "cancel_event": "event",
}

# Verb hints for non-compound identifiers (no underscore; decomposition does not apply)
VERB_HINTS: dict[str, str] = {
    "subleasing": "sublease",
}
