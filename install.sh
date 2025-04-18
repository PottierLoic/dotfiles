#!/bin/bash

OS_TYPE="$(uname -s)"

case "$OS_TYPE" in
  Linux)
    bash shells/alacritty.sh
    bash shells/nvim.sh
    bash shells/hypr.sh
    bash shells/wallpapers.sh
    bash shells/waybar.sh
    ;;
  Darwin)
    bash shells/alacritty.sh
    bash shells/nvim.sh
    bash shells/wallpapers.sh
    ;;
  MINGW* | MSYS* | CYGWIN*)
    bash shells/alacritty.sh
    bash shells/glazewm.sh
    bash shells/wallpapers.sh
    bash shells/nvim.sh
    ;;
  *)
    echo "Unsupported OS: $OS_TYPE"
    exit 1
    ;;
esac
