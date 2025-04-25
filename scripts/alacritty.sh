#!/bin/bash

# Determine platform-specific config path
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  ALACRITTY_PATH="$HOME/.config/alacritty"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ALACRITTY_PATH="$HOME/.config/alacritty"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  ALACRITTY_PATH="$APPDATA/alacritty"
else
  echo "Unknown operating system. Exiting."
  exit 1
fi

# Install new config
echo "Installing new configuration..."
mkdir -p "$ALACRITTY_PATH"
cp ./alacritty/alacritty.toml "$ALACRITTY_PATH/alacritty.toml"
echo "Installation complete."
