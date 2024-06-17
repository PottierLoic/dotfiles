#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  NVIM_PATH="$HOME/.config/nvim"
  INSTALL_CMD="sudo apt-get install -y neovim"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  NVIM_PATH="$HOME/.config/nvim"
  INSTALL_CMD="brew install neovim"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  NVIM_PATH="$LOCALAPPDATA/nvim"
  INSTALL_CMD="winget install --id=Neovim.Neovim -e"
else
  echo "Unknown operating system. Exiting."
  exit 1
fi

if ! command -v nvim %> /dev/null; then
  echo "Neovim is not installed. Installing..."
  eval $INSTALL_CMD
  if [ $? -ne 0 ]; then
    echo "Failed to install Neovim. Exiting."
    exit 1
  fi
else
  echo "Neovim is already installed."
fi

if [ -d "$NVIM_PATH" ]; then
  if diff -qr "$NVIM_PATH" nvim/ > /dev/null; then
    echo "Existing configuration is the same as the new configuration. No backup needed."
  else
    echo "Configuration has changed. Backing up existing nvim configuration..."
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
