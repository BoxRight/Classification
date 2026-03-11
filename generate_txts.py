import os
import subprocess
import sys

DEFAULT_DIR = '/home/maitreya/Classification/downloads'

def main():
    base_dir = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_DIR
    base_dir = os.path.abspath(base_dir)

    if not os.path.exists(base_dir):
        print(f"Directory not found: {base_dir}")
        return

    print(f"Scanning directory: {base_dir}")
    
    pdf_count = 0
    txt_count = 0
    error_count = 0

    for root, dirs, files in os.walk(base_dir):
        for file in files:
            if file.lower().endswith('.pdf'):
                pdf_count += 1
                pdf_path = os.path.join(root, file)
                txt_path = os.path.splitext(pdf_path)[0] + '.txt'

                if os.path.exists(txt_path):
                    # print(f"Skipping {file}: TXT already exists.")
                    continue

                try:
                    # Run pdftotext -layout
                    result = subprocess.run(
                        ['pdftotext', '-layout', pdf_path, txt_path],
                        capture_output=True,
                        text=True,
                        check=True
                    )
                    print(f"Generated: {txt_path}")
                    txt_count += 1
                except subprocess.CalledProcessError as e:
                    print(f"Error converting {file}: {e.stderr}")
                    error_count += 1
                except Exception as e:
                    print(f"Unexpected error on {file}: {e}")
                    error_count += 1

    print(f"\nSummary:")
    print(f"Total PDFs found: {pdf_count}")
    print(f"TXT files generated: {txt_count}")
    print(f"Errors: {error_count}")

if __name__ == '__main__':
    main()
