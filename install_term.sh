#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
  if ! grep -Rq "^deb .*https://apt.fury.io/wez" /etc/apt/sources.list /etc/apt/sources.list.d/; then
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
  fi
  INSTALL_CMD="sudo apt update && sudo apt install wezterm"
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
    if ! fc-list | grep -qi "0xProto"; then
      echo "0xProto font is not installed. Installing..."
      curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
      if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        unzip -j 0xProto.zip "0xProtoNerdFontMono-Regular.ttf" -d "$HOME/.local/share/fonts"
      else
        unzip -j 0xProto.zip "0xProtoNerdFontMono-Regular.ttf" -d "$HOME/Library/Fonts"
      fi
      fc-cache -fv
      rm -f 0xProto.zip
      echo "0xProto font has been installed."
    else
      echo "0xProto font is already installed."
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

echo "Copying .shared_colorscheme to $\HOME/.shared_colorschene"
cp ./term/.shared_colorscheme "$HOME/.shared_colorscheme"
echo ".shared_colorscheme has been copied successfully"

echo "Copying .wezterm.lua to $\HOME/.wezterm.lua"
cp ./term/.wezterm.lua "$HOME/.wezterm.lua"
echo ".wezterm.lua has been copied successfully."
