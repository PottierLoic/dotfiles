#!/bin/bash

echo "copying zsh and p10k config to $\home/"

if [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  cp ./zsh/.zshrcwin "$HOME/.zshrc"
else
  cp ./zsh/.zshrcunix "$HOME/.zshrc"
fi

cp ./zsh/.p10k.zsh "$HOME/.p10k.zsh"
