import os
import shutil
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads/Contratos'

# Order matters: Specific matches before general matches if they overlap
CATEGORIES = {
    'Compraventa': ['Compraventa'],
    'Arrendamiento': ['Arrendamiento', 'Alquiler'],
    'Prestación de Servicios': ['Prestación de Servicios', 'Servicios Profesionales', 'Servicios'],
    'Donación': ['Donación', 'Donacion'],
    'Mutuo': ['Mutuo'],
    'Comodato': ['Comodato'],
    'Mandato': ['Mandato'],
    'Promesa': ['Promesa'],
    'Cesión': ['Cesión', 'Cesion'],
    'Confidencialidad': ['Confidencialidad'],
    'Licencia': ['Licencia'],
    'Suministro': ['Suministro'],
    'Laboral': ['Laboral', 'Trabajo', 'Individual de Trabajo'],
    'Obra': ['Obra'],
    'Permuta': ['Permuta'],
    'Fianza': ['Fianza'],
    'Prenda': ['Prenda'],
    'Hipoteca': ['Hipoteca'],
    'Transacción': ['Transacción', 'Transaccion'],
    'Fideicomiso': ['Fideicomiso'],
    'Asociación en Participación': ['Asociación en Participación', 'Asociacion en Participacion'],
    'Usufructo': ['Usufructo'],
    'Anticresis': ['Anticresis'],
    'Asunción de Deuda': ['Asunción', 'Asuncion'],
    'Constitución': ['Constitución', 'Constitucion'],
    'Construcción': ['Construcción', 'Construccion'],
    'Copropiedad': ['Copropiedad'],
    'Superficie': ['Superficie'],
    'Distribución': ['Distribución', 'Distribucion'],
    'Hospedaje': ['Hospedaje'],
    'Juego': ['Juego'],
    'Maternidad Subrogada': ['Maternidad'],
    'Pago': ['Pago'],
    'Patrocinio': ['Patrocinio'],
    'Préstamo': ['Préstamo', 'Prestamo'],
    'Renta Vitalicia': ['Renta Vitalicia', 'Renta'],
    'Representación': ['Representación', 'Representacion'],
    'Servidumbre': ['Servidumbre'],
}


def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    base_dir = os.path.abspath(base_dir)
    
    if not os.path.exists(base_dir):
        print(f"Directory not found: {base_dir}")
        return

    print(f"Scanning directory: {base_dir}")

    try:
        items = os.listdir(base_dir)
    except OSError as e:
        print(f"Error listing directory: {e}")
        return

    # Filter for directories only
    dirs = [d for d in items if os.path.isdir(os.path.join(base_dir, d))]
    print(f"Found {len(dirs)} directories.")

    for folder_name in dirs:
        # Skip if it matches a category name exactly (already categorized folder)
        if folder_name in CATEGORIES.keys():
            continue

        target_category = None
        lower_name = folder_name.lower()

        # Find matching category
        for cat_name, keywords in CATEGORIES.items():
            for kw in keywords:
                if kw.lower() in lower_name:
                    target_category = cat_name
                    break
            if target_category:
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

            if os.path.exists(dest_path):
                 print(f"Skipping '{folder_name}': Destination '{dest_path}' already exists.")
                 continue

            try:
                print(f"Moving '{folder_name}' -> '{target_category}/{folder_name}'")
                shutil.move(src_path, dest_path)
            except Exception as e:
                print(f"Failed to move {folder_name}: {e}")

if __name__ == '__main__':
    main()
