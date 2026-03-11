"""
Deterministic Artifact Selector

Pure function: IR + Registry → Artifacts (institution, templates, principles)

No LLM logic, no heuristics, only registry-based matching.
"""

import json
from typing import Dict, List, Any, Optional


class ArtifactSelector:
    """Deterministic selector for legal artifacts based on IR structure."""
    
    def __init__(self, registry_path: str):
        """Load registry from JSON file."""
        with open(registry_path, 'r', encoding='utf-8') as f:
            self.registry = json.load(f)
    
    def select_artifacts(self, ir: Dict[str, Any]) -> Dict[str, Any]:
        """
        Main selection function.
        
        Args:
            ir: Intermediate representation (structured contract)
        
        Returns:
            {
                "institution": str,
                "templates": List[Dict],
                "principles": List[str]
            }
        """
        institution = self.select_institution(ir)
        templates = self.select_templates(ir)
        principles = self.select_principles(ir)
        
        return {
            "institution": institution,
            "templates": templates,
            "principles": principles
        }
    
    def select_institution(self, ir: Dict[str, Any]) -> str:
        """
        Select matching institution based on contract metadata and structure.
        
        Deterministic: First match wins.
        """
        for inst_id, institution in self.registry["institutions"].items():
            match_spec = institution["match"]
            
            # Check contract type
            if ir["metadata"]["contract_type"] != match_spec.get("contract_type"):
                continue
            
            # Check required roles
            required_roles = match_spec.get("required_roles", [])
            if not all(role in ir["roles"] for role in required_roles):
                continue
            
            # Check required objects
            required_objects = match_spec.get("required_objects", [])
            if not all(obj in ir["objects"] for obj in required_objects):
                continue
            
            # Check object attributes if specified
            if "object_attribute" in match_spec:
                obj_spec = match_spec["object_attribute"]
                obj_id = obj_spec["id"]
                
                if obj_id not in ir["objects"]:
                    continue
                
                obj = ir["objects"][obj_id]
                
                # Check attribute path (e.g., "attributes.purpose")
                if "attributes.purpose" in obj_spec:
                    expected = obj_spec["attributes.purpose"]
                    actual = obj.get("attributes", {}).get("purpose")
                    if actual != expected:
                        continue
            
            # Match found
            return institution["name"]
        
        raise ValueError("No matching institution found in registry")
    
    def select_templates(self, ir: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        Select all templates whose triggers match the IR.
        
        Returns list of template applications with parameters.
        """
        selected = []
        
        for template_id, template in self.registry["templates"].items():
            if self.evaluate_trigger(ir, template["trigger"]):
                application = self.build_template_application(ir, template)
                selected.append(application)
        
        return selected
    
    def select_principles(self, ir: Dict[str, Any]) -> List[str]:
        """
        Select all principles whose triggers match the IR.
        
        Returns list of principle names.
        """
        selected = []
        
        for principle_id, principle in self.registry["principles"].items():
            if self.evaluate_trigger(ir, principle["trigger"]):
                selected.append(principle["name"])
        
        return selected
    
    def evaluate_trigger(self, ir: Dict[str, Any], trigger: Dict[str, Any]) -> bool:
        """
        Evaluate if a trigger condition matches the IR.
        
        Pure boolean logic - no inference.
        """
        # Always trigger
        if trigger.get("always"):
            return True
        
        # Role exists
        if "role_exists" in trigger:
            return trigger["role_exists"] in ir["roles"]
        
        # Behavior exists
        if "behavior_exists" in trigger:
            return trigger["behavior_exists"] in ir["behaviors"]
        
        # Object exists
        if "object_exists" in trigger:
            return trigger["object_exists"] in ir["objects"]
        
        # Behavior category exists
        if "behavior_category" in trigger:
            category = trigger["behavior_category"]
            for behavior in ir["behaviors"].values():
                if behavior["category"] == category:
                    return True
            return False
        
        # Object attribute match
        if "object_attribute" in trigger:
            obj_spec = trigger["object_attribute"]
            obj_type = obj_spec.get("type")
            purpose = obj_spec.get("attributes.purpose")
            
            for obj_id, obj in ir["objects"].items():
                if obj_type and obj["type"] != obj_type:
                    continue
                
                if purpose:
                    actual_purpose = obj.get("attributes", {}).get("purpose")
                    if actual_purpose != purpose:
                        continue
                
                return True
            
            return False
        
        # Classification match (dot-notation path)
        for key, value in trigger.items():
            if key.startswith("classification."):
                field = key.split(".", 1)[1]
                actual = ir["metadata"]["classification"].get(field)
                if actual != value:
                    return False
        
        return True
    
    def build_template_application(self, ir: Dict[str, Any], template: Dict[str, Any]) -> Dict[str, Any]:
        """
        Build template application with concrete parameters from IR.
        
        Deterministic parameter extraction.
        """
        params = template.get("parameters", {})
        
        # Resolve parameter references
        resolved_params = {}
        for param_name, param_value in params.items():
            # If value is a role/object reference, keep as-is
            # If it's a fixed value, keep as-is
            resolved_params[param_name] = param_value
        
        return {
            "name": template["name"],
            "description": template.get("description", ""),
            "parameters": resolved_params
        }


def main():
    """Test selector with generated IR."""
    import sys
    
    registry_path = sys.argv[1] if len(sys.argv) > 1 else "legal_registry.json"
    ir_path = sys.argv[2] if len(sys.argv) > 2 else "downloads/Contratos/Arrendamiento/Contrato de arrendamiento de casa habitación/legal_ir_normative.json"
    
    # Load selector
    selector = ArtifactSelector(registry_path)
    
    # Load IR
    with open(ir_path, 'r', encoding='utf-8') as f:
        ir_list = json.load(f)
        ir = ir_list[0] if isinstance(ir_list, list) else ir_list
    
    # Select artifacts
    result = selector.select_artifacts(ir)
    
    # Print results
    print("=" * 60)
    print("ARTIFACT SELECTION RESULT")
    print("=" * 60)
    print(f"\nInstitution: {result['institution']}")
    
    print(f"\nTemplates ({len(result['templates'])}):")
    for template in result['templates']:
        print(f"  - {template['name']}")
        print(f"    Parameters: {json.dumps(template['parameters'], indent=6, ensure_ascii=False)}")
    
    print(f"\nPrinciples ({len(result['principles'])}):")
    for principle in result['principles']:
        print(f"  - {principle}")
    
    # Save augmented IR
    ir["institution"] = result["institution"]
    ir["principal_contract"]["templates"] = result["templates"]
    ir["principles"] = result["principles"]
    
    output_path = ir_path.replace(".json", "_complete.json")
    with open(output_path, 'w', encoding='utf-8') as f:
        json.dump([ir] if isinstance(ir_list, list) else ir, f, indent=2, ensure_ascii=False)
    
    print(f"\n✅ Complete IR saved to: {output_path}")


if __name__ == "__main__":
    main()
