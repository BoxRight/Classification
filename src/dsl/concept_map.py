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

# Map common temporal/date identifiers in intrinsic args to canonical object ids.
# Used when normalizing intrinsic predicate args (e.g. daysBetween) so they refer
# to declared objects instead of undeclared identifiers like notice_date.
INTRINSIC_ARG_ALIASES: dict[str, str] = {
    "notice_date": "cancellation_notice",
    "notification_date": "cancellation_notice",
    "cancellation_date": "cancellation_notice",
    "event_date": "event",
    "filing_date": "event",
}
