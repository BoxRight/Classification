"""
Legal Contract Analysis and IR Generation Package

Modules:
- analysis: Legal document text analysis
- ir: Intermediate representation generation
- selector: Deterministic artifact selection
- validation: Schema validation
"""

__version__ = "1.0.0"

from .analysis.legal_document import analyze_document
from .ir.generator import convert_to_normative_ir
from .selector.artifact_selector import ArtifactSelector

__all__ = [
    "analyze_document",
    "convert_to_normative_ir",
    "ArtifactSelector",
]
