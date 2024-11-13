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
    if [ -d "${NVIM_PATH}.bak" ]; then
      echo "Removing old backup..."
      rm -rf "${NVIM_PATH}.bak"
    fi
    mv "$NVIM_PATH" "${NVIM_PATH}.bak"
  fi
else
  echo "No existing nvim configuration found."
fi

echo "Installing new configuration..."
mkdir -p "$NVIM_PATH"
cp -r nvim/* "$NVIM_PATH"
echo "Installation complete."
