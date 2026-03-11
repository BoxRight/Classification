import os
import re
import json
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads/Contratos/Arrendamiento'

from src.analysis.legal_document import analyze_document

def extract_semantic_roles(basic_analysis, text):
    """Extract semantic role names from contract text."""
    roles = {}
    
    if "arrendador" in text.lower():
        roles["arrendador"] = "Person"
    if "arrendatario" in text.lower():
        roles["arrendatario"] = "Person"
    if "fiador" in text.lower():
        roles["fiador"] = "Person"
    
    if not roles:
        for idx, person in enumerate(basic_analysis['subjects']['physical_persons']):
            roles[f"role_{idx}"] = "Person"
    
    return roles

def extract_explicit_objects(contract_type, behaviors):
    """Create explicit object instances."""
    objects = {}
    
    if contract_type == "Arrendamiento":
        objects["inmueble"] = {"type": "Property", "attributes": {"purpose": "habitación"}}
        objects["renta_mensual"] = {"type": "Money", "attributes": {"purpose": "renta"}}
        objects["deposito_garantia"] = {"type": "Money", "attributes": {"purpose": "garantía"}}
        objects["plazo_arrendamiento"] = {"type": "Duration", "attributes": {}}
    
    return objects

def create_behaviors_with_complete_signatures(basic_analysis, roles, objects):
    """
    Create behaviors with complete signatures - NO EMPTY ARRAYS.
    Normalize duplicate behaviors into canonical predicates.
    Also create fact behaviors for ontology layer.
    """
    behaviors = {}
    facts = []
    
    role_names = list(roles.keys())
    arrendador = "arrendador" if "arrendador" in roles else role_names[0]
    arrendatario = "arrendatario" if "arrendatario" in roles else (role_names[1] if len(role_names) > 1 else "role_1")
    fiador = "fiador" if "fiador" in roles else (role_names[2] if len(role_names) > 2 else "role_2")
    
    behavior_category_map = {
        "Acto Jurídico (Obligación de Dar/Pagar)": "transfer",
        "Acto Jurídico (Obligación de Dar/Recibir)": "transfer",
        "Acto Jurídico (Concesión de Uso)": "use",
        "Acto Jurídico (Obligación de No Hacer)": "prohibition",
        "Acto Jurídico (Obligación de Hacer)": "maintenance",
        "Hecho Jurídico (Condición Resolutoria)": "termination"
    }
    
    fact_counter = 0
    payment_behavior_seen = False
    deposit_behavior_seen = False
    
    for idx, beh in enumerate(basic_analysis['object']['behaviors']):
        behavior_id = f"b_{idx}"
        desc = beh.get('description', '')
        
        # FACTS: Declarations stay in facts layer
        if "Declaración" in beh['type'] or "Hecho Jurídico" in beh['type']:
            # Determine fact category
            if "declara" in desc.lower() and "arrendador" in desc.lower():
                category = "representation"
                fact_beh_id = "capacidad_arrendador"
            elif "declara" in desc.lower() and "arrendatario" in desc.lower():
                category = "representation"
                fact_beh_id = "capacidad_arrendatario"
            elif "declara" in desc.lower() and "fiador" in desc.lower():
                category = "representation"
                fact_beh_id = "capacidad_fiador"
            elif "no existe" in desc.lower() or "dolo" in desc.lower():
                category = "warranty"
                fact_beh_id = "no_vicios_consentimiento"
            elif "recibido" in desc.lower() and "perfecto estado" in desc.lower():
                category = "state"
                fact_beh_id = "inmueble_entregado"
            elif "fiador solidario" in desc.lower():
                category = "declaration"
                fact_beh_id = "fianza_solidaria"
            elif "terminación" in desc.lower() or "vencimiento" in desc.lower():
                category = "state"
                fact_beh_id = "vencimiento_plazo"
            else:
                category = "state"
                fact_beh_id = f"fact_state_{fact_counter}"
                fact_counter += 1
            
            facts.append({
                "id": fact_beh_id,
                "category": category,
                "description": desc[:100]
            })
            continue
        
        # BEHAVIORS: Create with complete signatures and normalize duplicates
        category = behavior_category_map.get(beh['type'], "use")
        
        # Normalize duplicate payment behaviors into single pago_renta
        if category == "transfer" and ("pagar" in desc.lower() or "pagará" in desc.lower()):
            if not payment_behavior_seen:
                behaviors["pago_renta"] = {
                    "category": "transfer",
                    "signature": [arrendatario, "renta_mensual", arrendador],
                    "description": "Obligación de pago de renta mensual"
                }
                payment_behavior_seen = True
            continue  # Skip duplicate payment behaviors
        
        # Normalize deposit behaviors
        if category == "transfer" and ("depósito" in desc.lower() or "garantía" in desc.lower()):
            if not deposit_behavior_seen:
                behaviors["entrega_deposito"] = {
                    "category": "transfer",
                    "signature": [arrendatario, "deposito_garantia", arrendador],
                    "description": "Entrega de depósito en garantía"
                }
                deposit_behavior_seen = True
            continue
        
        # Other behaviors
        if category == "transfer":
            signature = [arrendador, "inmueble", arrendatario]
        elif category == "use":
            signature = [arrendatario, "inmueble"]
        elif category == "prohibition":
            signature = [arrendatario]
        elif category == "maintenance":
            # Check for cost-bearing obligation
            if "gastos" in desc.lower() or "cuenta" in desc.lower():
                behaviors["pago_gastos_mantenimiento"] = {
                    "category": "transfer",
                    "signature": [arrendatario, "gastos_mantenimiento", arrendador],
                    "description": "Obligación de pago de gastos de mantenimiento"
                }
                continue
            signature = [arrendatario, "inmueble"]
        elif category == "termination":
            signature = [arrendador, arrendatario]
        else:
            signature = [arrendatario]  # Fallback
        
        behaviors[behavior_id] = {
            "category": category,
            "signature": signature,
            "description": desc
        }
    
    # FIX #2: contrato_vigente category: use → state
    behaviors["contrato_vigente"] = {
        "category": "state",  # FIXED: Was "use"
        "signature": [arrendador, arrendatario],
        "description": "Estado: contrato en vigor sin incumplimiento"
    }
    
    # Add breach behavior for termination logic
    behaviors["incumplimiento_arrendatario"] = {
        "category": "prohibition",
        "signature": [arrendatario],
        "description": "Incumplimiento de obligaciones del arrendatario"
    }
    
    # FIX #3: Add termination-on-expiry behavior
    behaviors["vencimiento_plazo"] = {
        "category": "state",
        "signature": [arrendador, arrendatario],
        "description": "Vencimiento del plazo del arrendamiento"
    }
    
    # Add deposit object if not present
    if "gastos_mantenimiento" in [b.get('signature', [])[1] if len(b.get('signature', [])) > 1 else None for b in behaviors.values()]:
        objects["gastos_mantenimiento"] = {"type": "Money", "attributes": {"purpose": "mantenimiento"}}
    
    return behaviors, facts

def generate_conditional_clauses(basic_analysis, behaviors, facts):
    """
    Generate CNF clauses with proper literal kinds.
    Use 'behavior' and 'neg_behavior' only, not 'fact'.
    """
    normative_clauses = []
    clause_counter = 0
    
    # All norms conditional on contrato_vigente
    validity_behavior = "contrato_vigente"
    
    # FIX #3: Add termination-on-expiry clause
    # ¬vencimiento_plazo ∨ poder(terminar)
    normative_clauses.append({
        "id": f"clause_{clause_counter}",
        "form": "CNF",
        "literals": [
            {"kind": "neg_behavior", "ref": "vencimiento_plazo"},
            {"kind": "deontic", "ref": "terminar_contrato", "deontic_type": "power"}
        ],
        "clause_arity": 2,
        "source_clause": "Terminación al vencimiento del plazo determinado"
    })
    clause_counter += 1
    
    for idx, beh in enumerate(basic_analysis['object']['behaviors']):
        behavior_id = f"b_{idx}"
        
        # Skip if not in behaviors dict (it's a fact)
        if behavior_id not in behaviors:
            continue
        
        beh_type = beh['type']
        
        # Obligations: ¬contrato_vigente ∨ oblig(behavior)
        if "Obligación" in beh_type and "No Hacer" not in beh_type:
            normative_clauses.append({
                "id": f"clause_{clause_counter}",
                "form": "CNF",
                "literals": [
                    {"kind": "neg_behavior", "ref": validity_behavior},
                    {"kind": "deontic", "ref": behavior_id, "deontic_type": "oblig"}
                ],
                "clause_arity": 2,
                "source_clause": beh['description'][:80]
            })
            clause_counter += 1
        
        # Prohibitions: ¬contrato_vigente ∨ forbid(behavior)
        elif "No Hacer" in beh_type:
            normative_clauses.append({
                "id": f"clause_{clause_counter}",
                "form": "CNF",
                "literals": [
                    {"kind": "neg_behavior", "ref": validity_behavior},
                    {"kind": "deontic", "ref": behavior_id, "deontic_type": "forbid"}
                ],
                "clause_arity": 2,
                "source_clause": beh['description'][:80]
            })
            clause_counter += 1
        
        # Use obligations
        elif "Concesión de Uso" in beh_type:
            normative_clauses.append({
                "id": f"clause_{clause_counter}",
                "form": "CNF",
                "literals": [
                    {"kind": "neg_behavior", "ref": validity_behavior},
                    {"kind": "deontic", "ref": behavior_id, "deontic_type": "oblig"}
                ],
                "clause_arity": 2,
                "source_clause": beh['description'][:80]
            })
            clause_counter += 1
        
        # Termination: incumplimiento ∧ contrato_vigente → poder(rescindir)
        # CNF: ¬incumplimiento ∨ ¬contrato_vigente ∨ poder(rescindir)
        elif "Condición Resolutoria" in beh_type or "terminar" in beh.get('verb', ''):
            normative_clauses.append({
                "id": f"clause_{clause_counter}",
                "form": "CNF",
                "literals": [
                    {"kind": "neg_behavior", "ref": "incumplimiento_arrendatario"},
                    {"kind": "neg_behavior", "ref": validity_behavior},
                    {"kind": "deontic", "ref": behavior_id, "deontic_type": "power"}
                ],
                "clause_arity": 3,
                "source_clause": beh['description'][:80]
            })
            clause_counter += 1
    
    # Add canonical payment oblig if exists
    if "pago_renta" in behaviors:
        normative_clauses.append({
            "id": f"clause_{clause_counter}",
            "form": "CNF",
            "literals": [
                {"kind": "neg_behavior", "ref": validity_behavior},
                {"kind": "deontic", "ref": "pago_renta", "deontic_type": "oblig"}
            ],
            "clause_arity": 2,
            "source_clause": "Obligación de pago de renta mensual"
        })
        clause_counter += 1
    
    return normative_clauses

def infer_templates(basic_analysis, text, behaviors):
    """Infer templates with complete parameters."""
    templates = []
    
    # Find payment obligation for fianza to guarantee
    payment_obligation = None
    for beh_id, beh in behaviors.items():
        if beh['category'] == 'transfer' and 'renta_mensual' in beh.get('signature', []):
            payment_obligation = beh_id
            break
    
    if "fiador" in text.lower():
        templates.append({
            "name": "fianza_solidaria",
            "guaranteed_obligation": payment_obligation if payment_obligation else "pago_renta",
            "fiador_role": "fiador",
            "scope": "todas_obligaciones_arrendatario",
            "solidary": True
        })
    
    # FIX #4: Conditional deposit restitution
    if any("depósito" in b.get('description', '').lower() for b in basic_analysis['object']['behaviors']):
        templates.append({
            "name": "deposito_garantia",
            "secured_property": "inmueble",
            "amount_ref": "deposito_garantia",
            "restitution_condition": {
                "trigger": "desocupación",
                "requirements": [
                    "no_deuda_rentas",
                    "no_daños_inmueble"
                ]
            }
        })
    
    return templates

def convert_to_normative_ir(basic_analysis, text):
    """Generate architecturally correct normative IR."""
    
    contract_type = basic_analysis.get('contract_type_detected', 'Desconocido')
    
    # 1. Semantic roles
    roles = extract_semantic_roles(basic_analysis, text)
    
    # 2. Explicit objects
    objects = extract_explicit_objects(contract_type, basic_analysis['object']['behaviors'])
    
    # 3. Complete behaviors + facts
    behaviors, facts = create_behaviors_with_complete_signatures(basic_analysis, roles, objects)
    
    # 4. Conditional normative clauses with correct literal kinds
    normative_clauses = generate_conditional_clauses(basic_analysis, behaviors, facts)
    
    # 5. Complete templates
    templates = infer_templates(basic_analysis, text, behaviors)
    
    # 6. Fianza is template-driven, not institutional
    # Remove from accessory_contracts if templates handle it
    accessory_contracts = []
    
    ir = {
        "source": {
            "file_name": basic_analysis['file_name'],
            "document_id": "TMX1120572",
            "date": "2024-01-29"
        },
        "metadata": {
            "contract_type": contract_type,
            "classification": basic_analysis['classification']
        },
        "roles": roles,
        "objects": objects,
        "behaviors": behaviors,
        "facts": facts,
        "principal_contract": {
            "normative_clauses": normative_clauses,
            "templates": templates
        },
        "accessory_contracts": accessory_contracts
    }
    
    return ir

def main():
    target_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    target_dir = os.path.abspath(target_dir)

    print(f"Generating normative IR (v2): {target_dir}")
    
    results = []
    
    if not os.path.exists(target_dir):
        print("Directory not found")
        return

    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.lower().endswith('.txt'):
                path = os.path.join(root, file)
                print(f"Processing {file}...")
                
                basic_analysis = analyze_document(path)
                
                if basic_analysis:
                    with open(path, 'r', encoding='utf-8') as f:
                        text = f.read()
                    
                    ir = convert_to_normative_ir(basic_analysis, text)
                    results.append(ir)

    output_file = os.path.join(target_dir, 'legal_ir_normative.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print(f"\nNormative IR complete: {output_file}")
    
    if results:
        print(f"\nFacts: {len(results[0]['facts'])}")
        print(f"Behaviors: {len(results[0]['behaviors'])}")
        print(f"Normative clauses: {len(results[0]['principal_contract']['normative_clauses'])}")
        print(f"Templates: {len(results[0]['principal_contract']['templates'])}")

if __name__ == '__main__':
    main()
