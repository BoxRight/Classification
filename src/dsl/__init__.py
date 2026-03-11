"""IR → DSL deterministic renderer."""

from src.dsl.renderer import render_ir
from src.dsl.sanitizer import sanitize_ir

__all__ = ["render_ir", "sanitize_ir"]
