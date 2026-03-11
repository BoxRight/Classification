import os
import re
import json
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads/Contratos/Arrendamiento'

# Import the original script's classification logic
from legal_analysis import CONTRACT_DEFAULTS, ACCESSORY_DEFAULTS, NUANCE_RULES, analyze_document

def convert_to_logical_ir(basic_analysis, text):
    """
    Convert basic behavioral analysis to formal CNF/DNF logical IR.
    """
    
    # Extract roles from subjects
    roles = {}
    role_id_map = {}
    
    for idx, person in enumerate(basic_analysis['subjects']['physical_persons']):
        role_id = f"role_{idx}"
        roles[role_id] = "Person"
        role_id_map[person] = role_id
    
    # Extract and type objects
    objects = {}
    
    # Identify key contract objects based on contract type
    contract_type = basic_analysis.get('contract_type_detected', 'Desconocido')
    
    if contract_type == 'Arrendamiento':
        objects['inmueble'] = {"type": "Property", "attributes": {"purpose": "habitación"}}
        objects['renta_mensual'] = {"type": "Money", "attributes": {}}
        objects['plazo'] = {"type": "Duration", "attributes": {}}
        objects['deposito'] = {"type": "Money", "attributes": {"purpose": "garantía"}}
    
    # Convert behaviors to formal predicate structures
    behaviors = {}
    behavior_id_counter = 0
    
    behavior_category_map = {
        "Acto Jurídico (Obligación de Dar/Pagar)": "transfer",
        "Acto Jurídico (Obligación de Dar/Recibir)": "transfer",
        "Acto Jurídico (Concesión de Uso)": "use",
        "Acto Jurídico (Obligación de No Hacer)": "prohibition",
        "Acto Jurídico (Obligación de Hacer)": "maintenance",
        "Hecho Jurídico (Declaración de Hechos/Estado)": "fact",
        "Hecho Jurídico (Condición Resolutoria)": "termination",
        "Acto Jurídico (Renuncia de Derechos)": "declaration",
        "Acto Jurídico (Garantía)": "compensation"
    }
    
    for beh in basic_analysis['object']['behaviors']:
        behavior_id = f"b_{behavior_id_counter}"
        behavior_id_counter += 1
        
        category = behavior_category_map.get(beh['type'], "fact")
        
        # Infer signature based on verb and category
        signature = []
        if category == "transfer":
            signature = ["role_1", "objeto", "role_0"]  # payer, amount, payee
        elif category == "use":
            signature = ["role_1", "inmueble"]  # user, property
        elif category == "prohibition":
            signature = ["role_1"]  # prohibited party
        elif category == "fact":
            signature = ["role_0"]  # declarant
        elif category == "termination":
            signature = ["role_0", "role_1"]  # both parties
        
        behaviors[behavior_id] = {
            "category": category,
            "signature": signature,
            "description": beh['description']
        }
    
    # Generate CNF/DNF normative clauses
    normative_clauses = []
    clause_id_counter = 0
    
    # Pattern 1: Generate normative clauses based on behavior types
    # CRITICAL: Check "No Hacer" (prohibitions) BEFORE general "Obligación"
    # to avoid misclassifying prohibitions as obligations
    for idx, beh in enumerate(basic_analysis['object']['behaviors']):
        behavior_id = f"b_{idx}"
        
        # Check for prohibitions FIRST (before general "Obligación" check)
        if "No Hacer" in beh['type']:
            # Prohibition: forbid(behavior)
            clause_id = f"clause_{clause_id_counter}"
            clause_id_counter += 1
            
            normative_clauses.append({
                "id": clause_id,
                "form": "CNF",
                "literals": [
                    {
                        "kind": "deontic",
                        "ref": behavior_id,
                        "deontic_type": "forbid"
                    }
                ],
                "clause_arity": 1,
                "source_clause": beh['description'][:100]
            })
        
        elif "Obligación" in beh['type']:
            # Unconditional obligation: convert to single deontic literal
            clause_id = f"clause_{clause_id_counter}"
            clause_id_counter += 1
            
            normative_clauses.append({
                "id": clause_id,
                "form": "CNF",
                "literals": [
                    {
                        "kind": "deontic",
                        "ref": behavior_id,
                        "deontic_type": "oblig"
                    }
                ],
                "clause_arity": 1,
                "source_clause": beh['description'][:100]
            })
        
        elif "Declaración" in beh['type']:
            # Fact declaration: just a behavior literal (precondition)
            clause_id = f"clause_{clause_id_counter}"
            clause_id_counter += 1
            
            normative_clauses.append({
                "id": clause_id,
                "form": "CNF",
                "literals": [
                    {
                        "kind": "behavior",
                        "ref": behavior_id
                    }
                ],
                "clause_arity": 1,
                "source_clause": beh['description'][:100]
            })
    
    # Pattern 2: Conditional obligations (2-clause)
    # Example: contrato_vigente → oblig(pagar)
    # CNF: ¬contrato_vigente ∨ oblig(pagar)
    
    # Find "contrato_vigente" fact behavior
    contrato_vigente_id = None
    for idx, beh in enumerate(basic_analysis['object']['behaviors']):
        if "DECLARAN LAS PARTES" in beh.get('description', ''):
            contrato_vigente_id = f"b_{idx}"
            break
    
    if contrato_vigente_id:
        # Create conditional obligations
        for idx, beh in enumerate(basic_analysis['object']['behaviors']):
            behavior_id = f"b_{idx}"
            
            if "Obligación de Dar/Pagar" in beh['type'] or "Concesión de Uso" in beh['type']:
                clause_id = f"clause_{clause_id_counter}"
                clause_id_counter += 1
                
                normative_clauses.append({
                    "id": clause_id,
                    "form": "CNF",
                    "literals": [
                        {
                            "kind": "neg_behavior",
                            "ref": contrato_vigente_id
                        },
                        {
                            "kind": "deontic",
                            "ref": behavior_id,
                            "deontic_type": "oblig"
                        }
                    ],
                    "clause_arity": 2,
                    "source_clause": f"Contrato vigente → {beh['description'][:80]}"
                })
    
    # Pattern 3: Breach → Termination (3-clause)
    # Example: incumplimiento ∧ contrato_vigente → rescindir
    # CNF: ¬incumplimiento ∨ ¬contrato_vigente ∨ rescindir
    
    # Find termination behaviors
    for idx, beh in enumerate(basic_analysis['object']['behaviors']):
        behavior_id = f"b_{idx}"
        
        if "Condición Resolutoria" in beh['type'] or "terminar" in beh.get('verb', ''):
            clause_id = f"clause_{clause_id_counter}"
            clause_id_counter += 1
            
            # Create 3-clause: breach OR not_vigente OR terminate
            normative_clauses.append({
                "id": clause_id,
                "form": "CNF",
                "literals": [
                    {
                        "kind": "neg_behavior",
                        "ref": "b_incumplimiento"  # Placeholder for breach detection
                    },
                    {
                        "kind": "neg_behavior",
                        "ref": contrato_vigente_id if contrato_vigente_id else "b_vigente"
                    },
                    {
                        "kind": "behavior",
                        "ref": behavior_id
                    }
                ],
                "clause_arity": 3,
                "source_clause": beh['description'][:100]
            })
    
    # Build final IR structure
    ir = {
        "metadata": {
            "contract_type": contract_type,
            "file_name": basic_analysis['file_name'],
            "classification": basic_analysis['classification']
        },
        "roles": roles,
        "objects": objects,
        "behaviors": behaviors,
        "normative_clauses": normative_clauses,
        "templates": [],
        "principles": []
    }
    
    return ir

def main():
    target_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    target_dir = os.path.abspath(target_dir)

    print(f"Analyzing folder (CNF/DNF IR): {target_dir}")
    
    results = []
    
    if not os.path.exists(target_dir):
        print("Directory not found")
        return

    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.lower().endswith('.txt'):
                path = os.path.join(root, file)
                print(f"Processing {file}...")
                
                # Get basic analysis
                basic_analysis = analyze_document(path)
                
                if basic_analysis:
                    # Read text for IR conversion
                    with open(path, 'r', encoding='utf-8') as f:
                        text = f.read()
                    
                    # Convert to logical IR
                    ir = convert_to_logical_ir(basic_analysis, text)
                    results.append(ir)

    output_file = os.path.join(target_dir, 'legal_ir_cnf.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=2, ensure_ascii=False)
    
    print(f"\nCNF/DNF IR generation complete. Results saved to {output_file}")
    
    # Print sample
    if results:
        print("\nSample IR (first normative clause):")
        if results[0].get('normative_clauses'):
            print(json.dumps(results[0]['normative_clauses'][0], indent=2, ensure_ascii=False))

if __name__ == '__main__':
    main()
