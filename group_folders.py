import os
import shutil
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads'

# Mapping of keywords to Category Folder Name
# Order matters if there are overlaps, but these seem distinct enough for now.
CATEGORIES = {
    'Contrato': 'Contratos',
    'Acta': 'Actas',
    'Escrito': 'Escritos',
    'Escritura': 'Escrituras',
    'Demanda': 'Demandas',
    'Sentencia': 'Sentencias',
    'Solicitud': 'Solicitudes',
    'Auto': 'Autos',
    "Acuerdo": "Acuerdos",
    "Acción": "Acciones",
    "Alegatos": "Alegatos",
    "Carta": "Cartas",
    "Certificación": "Certificaciones",
    "Convenio": "Convenios",
    "Cesión": "Cesiones",
    "Constancia": "Constancias",
    "Copia": "Copias",
    "Estatutos": "Estatutos",
    "Fideicomiso": "Fideicomisos",
    "Juicio": "Juicios",
    "Mandato": "Mandatos",
    "Notificación": "Notificaciones",
    "Poder": "Poderes",
    "Requerimiento": "Requerimientos",
    "Aviso": "Avisos",
    "Denuncia": "Denuncias",
    "Incidente": "Incidentes",
    "Interrogatorio": "Interrogatorios",
    "Oficio": "Oficios",
    "Peritaje": "Peritajes",
    "Protocolo": "Protocolos",
    "Recurso": "Recursos",
    "Renuncia": "Renuncias",
    "Resolución": "Resoluciones",
    "Tercería": "Tercerías",
    "Amparo": "Amparos",
    "Asamblea": "Asambleas",
    "Cédula": "Cédulas",
    "Certificado": "Certificaciones",
    "Declaración": "Declaraciones",
    "Dictamen": "Dictámenes",
    "Edicto": "Edictos",
    "Informe": "Informes",
    "Inventario": "Inventarios",
    "Licencia": "Licencias",
    "Nombramiento": "Nombramientos",
    "Propuesta": "Propuestas",
}

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    base_dir = os.path.abspath(base_dir)
    
    if not os.path.exists(base_dir):
        print(f"Directory not found: {base_dir}")
        return

    print(f"Scanning directory: {base_dir}")

    # List all subdirectories
    try:
        items = os.listdir(base_dir)
    except OSError as e:
        print(f"Error listing directory: {e}")
        return

    dirs = [d for d in items if os.path.isdir(os.path.join(base_dir, d))]
    print(f"Found {len(dirs)} directories.")

    for folder_name in dirs:
        # Skip if the folder is one of our target categories to avoid recursion/mess
        if folder_name in CATEGORIES.values() or folder_name == 'Unclassified':
            continue

        target_category = None
        # Check matching keywords
        for keyword, category in CATEGORIES.items():
            if keyword.lower() in folder_name.lower():
                target_category = category
                break
        
        if target_category:
            src_path = os.path.join(base_dir, folder_name)
            dest_parent = os.path.join(base_dir, target_category)
            dest_path = os.path.join(dest_parent, folder_name)

            if not os.path.exists(dest_parent):
                try:
                    os.makedirs(dest_parent)
                    print(f"Created category folder: {target_category}")
                except OSError as e:
                    print(f"Error creating category folder {dest_parent}: {e}")
                    continue

            # Check if destination already exists
            if os.path.exists(dest_path):
                 print(f"Skipping '{folder_name}': Destination '{dest_path}' already exists.")
                 continue

            try:
                print(f"Moving '{folder_name}' -> '{target_category}/{folder_name}'")
                shutil.move(src_path, dest_path)
            except Exception as e:
                print(f"Failed to move {folder_name}: {e}")
        else:
            # Optional: Print skipped folders to see what's left
            # print(f"Skipping '{folder_name}': No matching category.")
            pass

if __name__ == '__main__':
    main()
