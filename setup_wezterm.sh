#!/bin/bash

echo "copying wezterm config to $\home/"

mkdir -p "$HOME/.wezterm"
cp ./wezterm/.wezterm.lua "$HOME/.wezterm.lua"
cp ./wezterm/colors.lua "$HOME/.wezterm/colors.lua"
