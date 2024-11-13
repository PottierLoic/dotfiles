#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers"

if ! pgrep -x "swww-daemon" > /dev/null; then
  echo "Starting swww-daemon..."
  swww init
fi

if [ -d "$WALLPAPER_DIR" ] && [ "$(ls -A $WALLPAPER_DIR)" ]; then
  RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
  
  echo "Setting wallpaper to $RANDOM_WALLPAPER"
  swww img "$RANDOM_WALLPAPER" --transition-type grow --transition-duration 1.5
else
  echo "Wallpaper directory is empty or does not exist."
  exit 1
fi
