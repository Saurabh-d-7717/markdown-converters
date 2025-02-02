import sys
import os
import subprocess

# Load configuration
CONFIG = {}
with open(os.path.join(os.path.dirname(__file__), '../config/config.bat')) as f:
    for line in f:
        if '=' in line:
            key, value = line.split('=', 1)
            CONFIG[key.strip()] = value.split('rem', 1)[0].strip().strip('"')

def convert_md_to_docx(md_file):
    docx_file = os.path.splitext(md_file)[0] + ".docx"
    try:
        subprocess.run(
            [CONFIG['PANDOC_PATH'], md_file, "-o", docx_file],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        print(f"Converted: {os.path.basename(docx_file)}")
    except Exception as e:
        print(f"Error: {str(e)}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Drag-and-drop a .md file onto this script")
        input("Press Enter to exit...")
    else:
        md_file = ' '.join(sys.argv[1:])
        if os.path.isfile(md_file):
            convert_md_to_docx(md_file)
            if os.path.exists(CONFIG['OUTPUT_DIR']):
                os.rename(docx_file, os.path.join(CONFIG['OUTPUT_DIR'], os.path.basename(docx_file)))
        else:
            print(f"File not found: {md_file}")
        input("Press Enter to exit...")