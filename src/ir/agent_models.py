"""
Pydantic models for the Legal IR (agent output format).

Validates API responses against the IR schema before saving.
"""

from __future__ import annotations

from typing import Any, Literal

from pydantic import BaseModel, Field


# --- Enums / Literals ---

Authority = Literal["private", "administrative", "judicial", "legislative", "constitutional"]
PartySubtype = Literal["physical", "legal"]
ObjectType = Literal["movable", "nonmovable", "money", "service"]
ActType = Literal["simple", "counter"]
FactType = Literal[
    "asset", "liability", "certification", "collateral",
    "capability", "ownership", "numeric", "date"
]
Modality = Literal["obligation", "claim", "prohibition", "privilege"]


# --- Nested structures ---

class Party(BaseModel):
    """Legal actor."""
    id: str
    type: Literal["person"] = "person"
    subtype: PartySubtype


class LegalObject(BaseModel):
    """Contractual or legal object."""
    id: str
    type: ObjectType


class Act(BaseModel):
    """Action between actors."""
    id: str | None = None
    type: ActType
    actor: str
    object: str | None = None  # noqa: A003 - optional for e.g. prohibition
    target: str | None = None


class InstitutionalFact(BaseModel):
    """Institutional condition (patrimony fact)."""
    type: FactType
    name: str
    subject: str | None = None
    value: Any = None


class Norm(BaseModel):
    """Normative generator."""
    modality: Modality
    act: Act


class Rule(BaseModel):
    """Rule that generates norms or facts."""
    id: str
    conditions: list[dict[str, Any]] = Field(default_factory=list)
    consequence: dict[str, Any]


class ProcedureStep(BaseModel):
    """Single step in a procedure."""
    act: Act | None = None
    ref: str | None = None
    description: str | None = None


class Procedure(BaseModel):
    """Sequence of acts."""
    name: str
    steps: list[dict[str, Any]] = Field(default_factory=list)


class TimelineEvent(BaseModel):
    """Event in a scenario timeline."""
    event: str
    condition: dict[str, Any] | None = None


class Scenario(BaseModel):
    """Scenario with timeline (if document describes events)."""
    name: str
    timeline: list[dict[str, Any]] = Field(default_factory=list)


# --- Top-level IR ---

class LegalIR(BaseModel):
    """Legal Intermediate Representation (agent output)."""
    law: str | None = None
    authority: Authority = "private"
    enacted: str | None = None
    imports: list[str] = Field(default_factory=list)
    parties: list[Party] = Field(default_factory=list)
    objects: list[LegalObject] = Field(default_factory=list)
    acts: list[Act] = Field(default_factory=list)
    facts: list[InstitutionalFact] = Field(default_factory=list)
    norms: list[Norm] = Field(default_factory=list)
    rules: list[Rule] = Field(default_factory=list)
    procedures: list[Procedure] = Field(default_factory=list)
    scenarios: list[Scenario] = Field(default_factory=list)

    model_config = {"extra": "allow"}  # Allow _source etc.


def validate_ir(data: dict[str, Any]) -> LegalIR:
    """Validate parsed JSON against the IR schema. Raises ValidationError on failure."""
    return LegalIR.model_validate(data)


def ir_to_dict(ir: LegalIR) -> dict[str, Any]:
    """Serialize validated IR to dict for JSON output."""
    return ir.model_dump(exclude_none=False, by_alias=False)


def get_json_schema() -> dict[str, Any]:
    """Generate JSON Schema from the LegalIR model."""
    return LegalIR.model_json_schema()
