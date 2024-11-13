#!/bin/bash

TARGET_DIR="$HOME/.config/hypr"

if [ -d "$TARGET_DIR" ]; then
  echo "Existing hypr configuration found. Renaming it to hypr.bak"
   if [ -d "$TARGET_DIR.bak" ]; then
    rm -rf "$TARGET_DIR.bak"
  fi
  mv "$TARGET_DIR" "$TARGET_DIR.bak"
fi

echo "Copying hypr/ to $TARGET_DIR"
cp -r ./hypr "$TARGET_DIR"
echo "hypr configuration has been copied successfully."
