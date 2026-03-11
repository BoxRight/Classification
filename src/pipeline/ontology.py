"""
Stage 2: Ontology binding.

Loads roles, objects, institutions and validates identifiers.
"""

import json
from pathlib import Path
from typing import Any


class Ontology:
    """Canonical ontology: roles, objects, institutions."""

    def __init__(self, project_root: Path | None = None):
        if project_root is None:
            project_root = Path(__file__).resolve().parent.parent.parent
        self.project_root = Path(project_root)
        self._roles: set[str] = set()
        self._objects: dict[str, str] = {}  # id -> type
        self._institutions: set[str] = set()
        self._load()

    def _load(self) -> None:
        """Load ontology files."""
        ontology_dir = self.project_root / "ontology"

        roles_path = ontology_dir / "roles.json"
        if roles_path.exists():
            data = json.loads(roles_path.read_text(encoding="utf-8"))
            self._roles = set(data.get("canonical", []))

        objects_path = ontology_dir / "objects.json"
        if objects_path.exists():
            data = json.loads(objects_path.read_text(encoding="utf-8"))
            for item in data.get("canonical", []):
                if isinstance(item, dict):
                    oid = item.get("id", "")
                    otype = item.get("type", "nonmovable")
                    if oid:
                        self._objects[oid] = otype
                elif isinstance(item, str):
                    self._objects[item] = "nonmovable"

        institutions_path = ontology_dir / "institutions.json"
        if institutions_path.exists():
            data = json.loads(institutions_path.read_text(encoding="utf-8"))
            self._institutions = set(data.get("canonical", []))

    def is_role(self, identifier: str) -> bool:
        """Check if identifier is a valid role."""
        return identifier in self._roles

    def is_object(self, identifier: str) -> bool:
        """Check if identifier is a valid object."""
        return identifier in self._objects

    def get_object_type(self, identifier: str) -> str:
        """Get object type (money, nonmovable, movable, service)."""
        return self._objects.get(identifier, "nonmovable")

    def is_institution(self, identifier: str) -> bool:
        """Check if identifier is a valid institution."""
        return identifier in self._institutions

    def validate_identifier(self, identifier: str, kind: str) -> bool:
        """Validate identifier for given kind (role, object, institution)."""
        if kind == "role":
            return self.is_role(identifier)
        if kind == "object":
            return self.is_object(identifier)
        if kind == "institution":
            return self.is_institution(identifier)
        return False

    @property
    def roles(self) -> set[str]:
        return self._roles

    @property
    def objects(self) -> set[str]:
        return set(self._objects.keys())

    @property
    def institutions(self) -> set[str]:
        return self._institutions
