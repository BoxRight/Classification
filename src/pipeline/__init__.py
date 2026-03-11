"""Deterministic IR-to-DSL compilation pipeline."""

from src.pipeline.normalizer import normalize_text
from src.pipeline.ontology import Ontology
from src.pipeline.grammar import parse_clauses
from src.pipeline.ir_builder import build_ir
from src.pipeline.dsl_renderer import render_dsl

__all__ = [
    "normalize_text",
    "Ontology",
    "parse_clauses",
    "build_ir",
    "render_dsl",
]
