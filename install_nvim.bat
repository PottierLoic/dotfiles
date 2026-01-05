@echo off

set SCRIPT_DIR=%~dp0
set SRC_DIR=%SCRIPT_DIR%nvim
set DEST_DIR=%LOCALAPPDATA%\nvim

echo Copying Neovim config
echo From: %SRC_DIR%
echo To:   %DEST_DIR%

if exist "%DEST_DIR%" (
  move "%DEST_DIR%" "%DEST_DIR%.backup"
)

xcopy "%SRC_DIR%" "%DEST_DIR%" /E /I /Y

echo Done.

