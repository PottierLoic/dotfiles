import json
from pathlib import Path
import subprocess


def generate_pywal_colors(image_path):
    image_path = str(image_path.resolve())
    command = ["wal", "-i", image_path, "--backend", "wal", "-n"]
    subprocess.run(command, check=True)
    print(f"Generated pywal colors for {image_path}")


def sanitize_json(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    sanitized_content = content.replace("\\", "\\\\")
    return json.loads(sanitized_content)


def lua_format(value):
    if isinstance(value, str):
        return f'"{value}"'
    elif isinstance(value, list):
        return "{" + ", ".join(lua_format(v) for v in value) + "}"
    elif isinstance(value, dict):
        return "{" + ", ".join(f"{k} = {lua_format(v)}" for k, v in value.items()) + "}"
    return str(value)


def update_wezterm_colors():
    wal_cache_dir = Path.home() / ".cache/wal"
    wal_colors_file = wal_cache_dir / "colors.json"

    if not wal_colors_file.exists():
        raise FileNotFoundError(f"Pywal colors.json not found at {wal_colors_file}")

    wal_colors = sanitize_json(wal_colors_file)

    wezterm_colors = {
        "foreground": wal_colors["special"]["foreground"],
        "background": wal_colors["special"]["background"],
        "cursor_bg": wal_colors["special"]["foreground"],
        "cursor_fg": wal_colors["special"]["background"],
        "cursor_border": wal_colors["special"]["foreground"],
        "selection_fg": wal_colors["special"]["background"],
        "selection_bg": wal_colors["special"]["foreground"],
        "ansi": [
            wal_colors["colors"]["color0"],
            wal_colors["colors"]["color1"],
            wal_colors["colors"]["color2"],
            wal_colors["colors"]["color3"],
            wal_colors["colors"]["color4"],
            wal_colors["colors"]["color5"],
            wal_colors["colors"]["color6"],
            wal_colors["colors"]["color7"],
        ],
        "brights": [
            wal_colors["colors"]["color8"],
            wal_colors["colors"]["color9"],
            wal_colors["colors"]["color10"],
            wal_colors["colors"]["color11"],
            wal_colors["colors"]["color12"],
            wal_colors["colors"]["color13"],
            wal_colors["colors"]["color14"],
            wal_colors["colors"]["color15"],
        ],
    }

    wezterm_colors_file = Path.home() / ".wezterm/colors.lua"
    wezterm_colors_file.parent.mkdir(parents=True, exist_ok=True)

    with open(wezterm_colors_file, "w", encoding="utf-8") as f:
        f.write("return " + lua_format(wezterm_colors))
    print(f"WezTerm colors updated at {wezterm_colors_file}")


if __name__ == "__main__":
    image_path = Path("../../Wallpapers/cozy.jpg")
    generate_pywal_colors(image_path)
    update_wezterm_colors()
