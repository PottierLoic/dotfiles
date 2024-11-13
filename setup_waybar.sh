
#!/bin/bash

TARGET_DIR="$HOME/.config/waybar"

if [ -d "$TARGET_DIR" ]; then
  echo "Existing waybar configuration found. Renaming it to waybar.bak"
  if [ -d "$TARGET_DIR.bak" ]; then
    rm -rf "$TARGET_DIR.bak"
  fi
  mv "$TARGET_DIR" "$TARGET_DIR.bak"
fi

echo "Copying waybar/ to $TARGET_DIR"
cp -r ./waybar "$TARGET_DIR"
echo "waybar configuration has been copied successfully."

killall waybar
waybar & disown 
