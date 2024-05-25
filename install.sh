#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  NVIM_PATH="$HOME/.config/nvim"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  NVIM_PATH="$HOME/.config/nvim"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  NVIM_PATH="$LOCALAPPDATA/nvim"
else
  echo "Unknown operating system. Exiting."
  exit 1
fi

if [ -d "$NVIM_PATH" ]; then
  echo "Backing up existing nvim configuration..."
  mv "$NVIM_PATH" "${NVIM_PATH}.bak"
  mv "${NVIM_PATH}-data" "${NVIM_PATH}-data.bak"
else
  echo "No existing nvim configuration found."
fi

echo "Installing new configuration..."
mkdir -p "$NVIM_PATH"
cp -r nvim/* "$NVIM_PATH"
echo "Installation complete."