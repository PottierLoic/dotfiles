import sys
import subprocess
from pathlib import Path

def generate_pywal_colors(image_path):
    image_path = str(Path(image_path).resolve())
    command = ["wal", "-i", image_path, "--backend", "wal", "-n"]
    subprocess.run(command, check=True)

if __name__ == "__main__":
    image_path = sys.argv[1]
    generate_pywal_colors(image_path)
