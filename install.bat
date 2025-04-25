@echo off
setlocal

call .\scripts\packages.bat %*

bash shells/alacritty.sh
bash shells/glazewm.sh
bash shells/wallpapers.sh
bash shells/nvim.sh

echo.
echo Installation complete!
pause
