import os
import re
import json
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads/Contratos/Arrendamiento'

# Domain Knowledge Defaults (Bonnecase/Savigny)
# Domain Knowledge Defaults (Bonnecase/Savigny)
# User-verified rules
CONTRACT_DEFAULTS = {
    'Compraventa': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Instantáneo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Permuta': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Instantáneo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Donación': {'obligations': 'Unilateral', 'economic': 'Gratuito', 'perfection': 'Consensual', 'execution': 'Instantáneo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Mutuo': {'obligations': 'Unilateral', 'economic': 'Gratuito', 'perfection': 'Real', 'execution': 'Instantáneo', 'dependence': 'Principal', 'certainty': 'Conmutativo'}, # Default Simple
    'Comodato': {'obligations': 'Bilateral', 'economic': 'Gratuito', 'perfection': 'Real', 'execution': 'Sucesivo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Arrendamiento': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Sucesivo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Depósito': {'obligations': 'Unilateral', 'economic': 'Gratuito', 'perfection': 'Real', 'execution': 'Sucesivo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Mandato': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Sucesivo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Prestación de Servicios': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Sucesivo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
    'Transporte': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Consensual', 'execution': 'Instantáneo', 'dependence': 'Principal', 'certainty': 'Conmutativo'},
}

# Accessory Contracts (To be nested in Object)
ACCESSORY_DEFAULTS = {
    'Fianza': {'obligations': 'Unilateral', 'economic': 'Gratuito', 'perfection': 'Consensual', 'execution': 'Instantáneo', 'dependence': 'Accesorio', 'certainty': 'Conmutativo'},
    'Prenda': {'obligations': 'Bilateral', 'economic': 'Oneroso', 'perfection': 'Real', 'execution': 'Sucesivo', 'dependence': 'Accesorio', 'certainty': 'Conmutativo'},
    'Hipoteca': {'obligations': 'Unilateral', 'economic': 'Gratuito', 'perfection': 'Formal', 'execution': 'Sucesivo', 'dependence': 'Accesorio', 'certainty': 'Conmutativo'},
}

# Nuance Rules (Regex override)
NUANCE_RULES = {
    'Mutuo': {
        'Oneroso': ['interés', 'interes', 'rédito', '%'], # If found -> Oneroso
    },
    'Mandato': {
        'Gratuito': ['gratuito', 'sin retribución', 'sin costo'], # If found -> Gratuito
    },
    'Depósito': {
        'Oneroso': ['retribución', 'pago', 'cobro'], # If found -> Oneroso
    }
}

def analyze_document(file_path):
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            text = f.read()
    except Exception as e:
        print(f"Error reading {file_path}: {e}")
        return None

    # Normalization
    text_lower = text.lower()
    
    # 1. Subject Extraction
    subjects = {
        "legal_persons": [],
        "physical_persons": []
    }
    
    # Heuristics for Legal Persons
    legal_patterns = [
        r'\b[A-Z][a-z\s]+S\.?\s?A\.?\b',
        r'\b[A-Z][a-z\s]+S\.?\s?C\.?\b',
        r'\b[A-Z][a-z\s]+S\.?\s?de\s?R\.?\s?L\.?\b',
        r'\b[A-Z][a-z\s]+Inc\.?\b',
        r'\b[A-Z][a-z\s]+S\.?\s?A\.?\s?B\.?\s?de\s?C\.?\s?V\.?\b'
    ]
    for pattern in legal_patterns:
        matches = re.findall(pattern, text)
        for m in matches:
            if m not in subjects["legal_persons"] and len(m) > 5:
                 subjects["legal_persons"].append(m)

    # Heuristics for Physical Persons (Expanded)
    # Look for "señor(a) Name" or "C. Name", or just captured roles with underscores in templates
    # This specifically handles the template case where names are blanks
    if "____" in text:
        if "EL ARRENDADOR" in text:
            subjects["physical_persons"].append("EL ARRENDADOR (Template Placeholder)")
        if "EL ARRENDATARIO" in text:
             subjects["physical_persons"].append("EL ARRENDATARIO (Template Placeholder)")
        if "EL FIADOR" in text:
             subjects["physical_persons"].append("EL FIADOR (Template Placeholder)")

    phys_patterns = [
         r'\b(?:Señor|Señora|Sr\.|Sra\.|C\.)\s+([A-Z][a-z]+\s[A-Z][a-z]+(?:\s[A-Z][a-z]+)?)'
    ]
    for pattern in phys_patterns:
        matches = re.findall(pattern, text)
        for m in matches:
             if m not in subjects["physical_persons"]:
                 subjects["physical_persons"].append(m)

    # 2. Behavior/Object Extraction
    behaviors = []
    
    # Find Clause section
    clause_start = re.search(r'(CL[ÁA]USULAS?|DECLARACIONES)', text, re.IGNORECASE)
    if clause_start:
        content_text = text[clause_start.start():]
        # Split by typical clause numbering
        # Split by typical clause numbering (Expanded)
        # Matches "PRIMERA.-", "Primera.-", "1.-", "1)", "DÉCIMA PRIMERA.-"
        clauses = re.split(r'\b(?:[A-ZÉÁÍÓÚÑ]+(?:\s[A-ZÉÁÍÓÚÑ]+)?|[A-Z][a-zéáíóúñ]+(?:\s[a-z]+)?)\s?[-.]', content_text)
        
        # Fallback if split didn't work well (e.g. strict ordinal list)
        if len(clauses) < 2:
            clauses = re.split(r'\n\s*(?:[1-9][0-9]*\.?|I{1,3}|IV|V|VI|VII|VIII|IX|X)\.?\s+', content_text)

        for clause in clauses[1:]: # Skip preamble
            clause = clause.strip()
            if not clause or len(clause) < 10: continue
            
            # Find key verbs anywhere in the first 100 chars
            intro = clause[:150].lower()
            
            verb_found = None
            b_type = "Acto Jurídico"
            
            # Obligations (Do/Give) & Facts
            if any(v in intro for v in ['pagar', 'pagará', 'liquidará', 'cubrirá', 'pago']):
                verb_found = "pagar"
                b_type = "Acto Jurídico (Obligación de Dar/Pagar)"
            elif any(v in intro for v in ['entregar', 'entregará', 'devuelva', 'devolver', 'recibir', 'recibe']):
                verb_found = "entregar/recibir"
                b_type = "Acto Jurídico (Obligación de Dar/Recibir)"
            elif any(v in intro for v in ['no podrá', 'prohibido', 'se prohibe', 'no deberá', 'no enajenar']):
                verb_found = "prohibir"
                b_type = "Acto Jurídico (Obligación de No Hacer)"
            elif any(v in intro for v in ['arrendar', 'arrienda', 'uso', 'habitar', 'ocupar']):
                verb_found = "arrendar/usar"
                b_type = "Acto Jurídico (Concesión de Uso)"
            elif any(v in intro for v in ['conservar', 'cuidar', 'mantenimiento', 'reparaciones']):
                verb_found = "conservar/reparar"
                b_type = "Acto Jurídico (Obligación de Hacer)"
            elif any(v in intro for v in ['rescindir', 'terminación', 'concluya', 'vencimiento', 'desocupar']):
                verb_found = "terminar"
                b_type = "Hecho Jurídico (Condición Resolutoria)" 
            elif any(v in intro for v in ['renuncia', 'renuncian']):
                verb_found = "renunciar"
                b_type = "Acto Jurídico (Renuncia de Derechos)"
            elif any(v in intro for v in ['garantizar', 'garantía', 'depósito']):
                verb_found = "garantizar"
                b_type = "Acto Jurídico (Garantía)"
            elif any(v in intro for v in ['declara', 'declaran', 'cuenta con', 'es propietario', 'tiene interés']):
                verb_found = "declarar/ser"
                b_type = "Hecho Jurídico (Declaración de Hechos/Estado)"
            elif any(v in intro for v in ['entregar', 'entregará', 'devuelva', 'devolver']):
                verb_found = "entregar"
                b_type = "Acto Jurídico (Obligación de Dar)"
            elif any(v in intro for v in ['arrendar', 'arrienda', 'uso']):
                verb_found = "arrendar"
                b_type = "Acto Jurídico (Concesión de Uso)"
            elif any(v in intro for v in ['no podrá', 'prohibido', 'se prohibe', 'no deberá']):
                verb_found = "prohibir"
                b_type = "Acto Jurídico (Obligación de No Hacer)"
            elif any(v in intro for v in ['conservar', 'cuidar', 'mantenimiento']):
                verb_found = "conservar"
                b_type = "Acto Jurídico (Obligación de Hacer)"
            elif any(v in intro for v in ['rescindir', 'terminación', 'concluya', 'vencimiento']):
                verb_found = "terminar"
                b_type = "Hecho Jurídico (Condición Resolutoria)" # often acts as fact/event
            
            if verb_found:
                 desc = clause[:150].replace('\n', ' ').strip() + '...'
                 behaviors.append({
                    "verb": verb_found,
                    "type": b_type,
                    "description": desc
                })

    # 2.1 Accessory Contract Detection (Nested in Object)
    accessories = []
    
    # Fianza
    if "fiador" in text_lower or "fianza" in text_lower:
        # Check if it's not the main title (e.g. not a Contrato de Fianza main file)
        # For this script we assume the main folder defines the main type, so this is likely accessory
        if "fianza" not in os.path.basename(file_path).lower():
            acc_data = ACCESSORY_DEFAULTS['Fianza'].copy()
            acc_data["type"] = "Fianza"
            accessories.append(acc_data)

    # Hipoteca
    if "hipoteca" in text_lower or "garantía hipotecaria" in text_lower:
        if "hipoteca" not in os.path.basename(file_path).lower():
            acc_data = ACCESSORY_DEFAULTS['Hipoteca'].copy()
            acc_data["type"] = "Hipoteca"
            accessories.append(acc_data)

    # Prenda
    if "prenda" in text_lower:
        if "prenda" not in os.path.basename(file_path).lower():
            acc_data = ACCESSORY_DEFAULTS['Prenda'].copy()
            acc_data["type"] = "Prenda"
            accessories.append(acc_data)

    # 3. Contract Classification (Domain Knowledge + Nuance)
    
    # Identify type from file path or content (Naive approach: check path keywords)
    contract_type = "Desconocido"
    norm_path = file_path.lower()
    
    defaults = {
        "obligations": "Bilateral",
        "economic": "Oneroso",
        "perfection": "Consensual",
        "execution": "Instantáneo", 
        "certainty": "Conmutativo", 
        "dependence": "Principal"
    }

    # Match path to known types
    for c_type in CONTRACT_DEFAULTS.keys():
        if c_type.lower() in norm_path or c_type.lower() in text_lower[:500]: # Check path and header
            contract_type = c_type
            defaults = CONTRACT_DEFAULTS[c_type].copy()
            break
            
    # Apply Nuances
    if contract_type == 'Mutuo':
        if any(x in text_lower for x in NUANCE_RULES['Mutuo']['Oneroso']):
            defaults['economic'] = 'Oneroso'
            defaults['obligations'] = 'Bilateral' # Often bilateral if interest involved
        else:
             defaults['economic'] = 'Gratuito'
             
    elif contract_type == 'Mandato':
        if any(x in text_lower for x in NUANCE_RULES['Mandato']['Gratuito']):
            defaults['economic'] = 'Gratuito'
            defaults['obligations'] = 'Unilateral' # Only mandatario acts?
            
    elif contract_type == 'Depósito':
        if any(x in text_lower for x in NUANCE_RULES['Depósito']['Oneroso']):
            defaults['economic'] = 'Oneroso'
            defaults['obligations'] = 'Bilateral'

    # Global overrides for specific attributes if strong evidence exists
    if "escritura pública" in text_lower or "notario" in text_lower:
        defaults['perfection'] = 'Formal'
        
    if "juego" in text_lower or "apuesta" in text_lower or "renta vitalicia" in text_lower:
        defaults["certainty"] = "Aleatorio"

    return {
        "file_name": os.path.basename(file_path),
        "contract_type_detected": contract_type,
        "subjects": subjects,
        "object": {
            "description": f"Objeto valido para {contract_type}",
            "behaviors": behaviors, # Full list for exhaustiveness
            "accessory_contracts": accessories
        },
        "classification": defaults
    }

def main():
    target_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    target_dir = os.path.abspath(target_dir)

    print(f"Analyzing folder: {target_dir}")
    
    results = []
    
    if not os.path.exists(target_dir):
        print("Directory not found")
        return

    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.lower().endswith('.txt'):
                path = os.path.join(root, file)
                print(f"Processing {file}...")
                analysis = analyze_document(path)
                if analysis:
                    results.append(analysis)

    output_file = os.path.join(target_dir, 'legal_analysis_results.json')
    with open(output_file, 'w', encoding='utf-8') as f:
        json.dump(results, f, indent=4, ensure_ascii=False)
    
    print(f"\nAnalysis complete. Results saved to {output_file}")
    # Print a sample entry
    if results:
        print("\nSample Analysis:")
        print(json.dumps(results[0], indent=2, ensure_ascii=False))

if __name__ == '__main__':
    main()
