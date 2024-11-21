#!/bin/bash

WAL_COLORS="$HOME/.cache/wal/colors.json"
if [[ ! -f "$WAL_COLORS" ]]; then
    echo "Error: no color.json file"
    exit 1
fi

# Wezterm here
TEMP_COLORS_JSON=$(mktemp)
sed 's#\\#\\\\#g' "$WAL_COLORS" > "$TEMP_COLORS_JSON"
mkdir -p "$HOME/.wezterm"
cat <<EOF > "$HOME/.wezterm/colors.lua"
return {
    foreground = "$(jq -r '.special.foreground' "$TEMP_COLORS_JSON")",
    background = "$(jq -r '.special.background' "$TEMP_COLORS_JSON")",
    cursor_bg = "$(jq -r '.special.cursor' "$TEMP_COLORS_JSON")",
    cursor_fg = "$(jq -r '.special.background' "$TEMP_COLORS_JSON")",
    cursor_border = "$(jq -r '.special.cursor' "$TEMP_COLORS_JSON")",
    selection_fg = "$(jq -r '.special.foreground' "$TEMP_COLORS_JSON")",
    selection_bg = "$(jq -r '.special.background' "$TEMP_COLORS_JSON")",
    ansi = {
        "$(jq -r '.colors.color0' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color1' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color2' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color3' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color4' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color5' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color6' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color7' "$TEMP_COLORS_JSON")"
    },
    brights = {
        "$(jq -r '.colors.color8' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color9' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color10' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color11' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color12' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color13' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color14' "$TEMP_COLORS_JSON")",
        "$(jq -r '.colors.color15' "$TEMP_COLORS_JSON")"
    },
}
EOF
touch "$HOME/.wezterm.lua"

# Waybar here
mkdir -p "$HOME/.config/waybar"
cat <<EOF > "$HOME/.config/waybar/colors-waybar.css"
@define-color foreground $(jq -r '.special.foreground' "$TEMP_COLORS_JSON");
@define-color background $(jq -r '.special.background' "$TEMP_COLORS_JSON");
@define-color cursor $(jq -r '.special.cursor' "$TEMP_COLORS_JSON");
@define-color color0 $(jq -r '.colors.color0' "$TEMP_COLORS_JSON");
@define-color color1 $(jq -r '.colors.color1' "$TEMP_COLORS_JSON");
@define-color color2 $(jq -r '.colors.color2' "$TEMP_COLORS_JSON");
@define-color color3 $(jq -r '.colors.color3' "$TEMP_COLORS_JSON");
@define-color color4 $(jq -r '.colors.color4' "$TEMP_COLORS_JSON");
@define-color color5 $(jq -r '.colors.color5' "$TEMP_COLORS_JSON");
@define-color color6 $(jq -r '.colors.color6' "$TEMP_COLORS_JSON");
@define-color color7 $(jq -r '.colors.color7' "$TEMP_COLORS_JSON");
@define-color color8 $(jq -r '.colors.color8' "$TEMP_COLORS_JSON");
@define-color color9 $(jq -r '.colors.color9' "$TEMP_COLORS_JSON");
@define-color color10 $(jq -r '.colors.color10' "$TEMP_COLORS_JSON");
@define-color color11 $(jq -r '.colors.color11' "$TEMP_COLORS_JSON");
@define-color color12 $(jq -r '.colors.color12' "$TEMP_COLORS_JSON");
@define-color color13 $(jq -r '.colors.color13' "$TEMP_COLORS_JSON");
@define-color color14 $(jq -r '.colors.color14' "$TEMP_COLORS_JSON");
@define-color color15 $(jq -r '.colors.color15' "$TEMP_COLORS_JSON");
EOF
rm "$TEMP_COLORS_JSON"
pkill -SIGUSR2 waybar # TODO: Check this not sure
