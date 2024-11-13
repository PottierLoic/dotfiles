#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"
LAST_WALLPAPER_FILE="$HOME/.last_wallpaper"

if ! pgrep -x "swww-daemon" > /dev/null; then
  swww init
fi

if [ -d "$WALLPAPER_DIR" ] && [ "$(ls -A "$WALLPAPER_DIR")" ]; then
  while true; do
    NEW_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
    if [ "$NEW_WALLPAPER" != "$(cat "$LAST_WALLPAPER_FILE" 2>/dev/null)" ]; then
      break
    fi
  done
  echo "Setting wallpaper to $NEW_WALLPAPER"
  swww img "$NEW_WALLPAPER" --transition-type grow --transition-duration 1.5
  echo "$NEW_WALLPAPER" > "$LAST_WALLPAPER_FILE"
else
  echo "Wallpaper directory is empty or does not exist."
  exit 1
fi

