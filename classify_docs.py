import os
import subprocess
import shutil
import re
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads'

def sanitize_filename(name):
    """Remove invalid characters for directory names."""
    return re.sub(r'[<>:"/\\|?*]', '', name).strip()

def get_pdf_title(filepath):
    """
    Extract the 'Title' field from the first page of the PDF using pdftotext.
    Returns the title string or None if not found/error.
    """
    try:
        # Extract first page text matching layout
        # -l 1: first page only
        result = subprocess.run(
            ['pdftotext', '-layout', '-l', '1', filepath, '-'],
            capture_output=True,
            text=True,
            check=True
        )
        content = result.stdout
        
        for line in content.splitlines():
            line = line.strip()
            if line.startswith('Title:'):
                # Split on first occurrence of 'Title:' and take the rest
                return line.split('Title:', 1)[1].strip()
    except Exception as e:
        print(f"Error reading {filepath}: {e}")
    return None

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    base_dir = os.path.abspath(base_dir)
    
    if not os.path.exists(base_dir):
        print(f"Directory not found: {base_dir}")
        return

    print(f"Scanning directory: {base_dir}")

    files = [f for f in os.listdir(base_dir) if f.lower().endswith('.pdf')]
    print(f"Found {len(files)} PDF files.")

    for filename in files:
        filepath = os.path.join(base_dir, filename)
        title = get_pdf_title(filepath)
        
        dest_folder_name = 'Unclassified'
        if title:
            # Sanitize and use the extracted title
            sanitized = sanitize_filename(title)
            if sanitized:
                dest_folder_name = sanitized
        
        dest_dir = os.path.join(base_dir, dest_folder_name)
        if not os.path.exists(dest_dir):
            try:
                os.makedirs(dest_dir)
            except OSError as e:
                print(f"Error creating directory {dest_dir}: {e}")
                continue
            
        dest_path = os.path.join(dest_dir, filename)
        
        # Simple collision handling: skip if exists
        if os.path.exists(dest_path):
            print(f"Skipping '{filename}': Destination '{dest_path}' already exists.")
            continue

        try:
            print(f"Moving '{filename}' -> '{dest_folder_name}/'")
            shutil.move(filepath, dest_path)
        except Exception as e:
            print(f"Failed to move {filename}: {e}")

if __name__ == '__main__':
    main()
