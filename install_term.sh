#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  INSTALL_CMD="sudo apt update && sudo apt install -y wezterm"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  INSTALL_CMD="brew install --cask wezterm"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  INSTALL_CMD="winget install wez.wezterm"
else
  echo "Unsupported operating system. Exiting."
  exit 1
fi

if ! command -v wezterm &> /dev/null
then
  echo "WezTerm is not installed. Installing WezTerm via winget..."
  eval $INSTALL_CMD
  echo "WezTerm installation complete"
else
  echo "WezTerm is already installed."
fi

case "$OSTYPE" in
  linux-gnu*|darwin*)
    if ! fc-list | grep -qi "Fira Code"; then
        echo "Fira Code font is not installed. Installing..."
        curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
        unzip -j FiraCode.zip "FiraCodeNerdFontMono-Regular.ttf" -d "$HOME/.fonts"
        fc-cache -fv
        rm -f FiraCode.zip
        echo "Fira Code font has been installed."
    else
        echo "Fira Code font is already installed."
    fi
    ;;
  cygwin*|msys*|win32*)
    echo "Running Windows-specific font installation..."
    powershell.exe -File font/install_font.ps1
    ;;
  *)
    echo "Unsupported OS. No font installation performed."
    ;;
esac

echo "Copying .wezterm.lua to $\HOME/.wezterm.lua"
cp ./term/.wezterm.lua "$HOME/.wezterm.lua"

echo ".wezterm.lua has been copied successfully."
