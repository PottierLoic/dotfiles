if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt-get install ripgrep
elif [[ "$OSTYPE" == "darwin"* ]]; then
  sh brew install ripgrep
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
  winget install BurntSushi.ripgrep.MSVC
else
  echo "Unknown operating system. Exiting."
  exit 1
fi
