@echo off
setlocal enabledelayedexpansion

set "INSTALL_EXTRA=false"
for %%a in (%*) do (
  if "%%a"=="--extra" set "INSTALL_EXTRA=true"
)

REM Bootstrap Scoop if not installed
where scoop >nul 2>nul
if errorlevel 1 (
  echo Scoop not found. Installing Scoop...
  powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
  powershell -Command "iwr -useb get.scoop.sh | iex"
) else (
  echo Scoop is already installed.
)

echo Installing packages via scoop...
scoop install alacritty
scoop install glazewm
scoop install msys2
scoop install neovim
scoop install 7zip

if "%INSTALL_EXTRA%"=="true" (
  echo --extra detected, installing extras...
  scoop bucket add extras
  scoop install spotify
  scoop install discord
)

REM Install Zsh inside MSYS2
echo Installing Zsh in MSYS2...
C:\msys64\usr\bin\bash.exe -lc "pacman -Sy --noconfirm zsh git"

REM Install Powerlevel10k for Zsh
echo Installing Powerlevel10k for Zsh...
C:\msys64\usr\bin\bash.exe -lc "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k"

REM Optionally set Zsh as default shell
echo Setting Zsh as default shell in MSYS2...
C:\msys64\usr\bin\bash.exe -lc "echo 'exec zsh' >> ~/.bashrc"

echo Modifying nsswitch.conf for MSYS2...
set "NSSWITCH_PATH=C:\msys64\etc\nsswitch.conf"
if exist "%NSSWITCH_PATH%" (
  (
    echo # Begin /etc/nsswitch.conf
    echo.
    echo passwd: files db
    echo group: files db
    echo.
    echo db_enum: cache builtin
    echo.
    echo db_home: windows
    echo db_shell: cygwin desc
    echo db_gecos: cygwin desc
    echo.
    echo # End /etc/nsswitch.conf
  ) > "%NSSWITCH_PATH%"
  echo nsswitch.conf has been updated.
) else (
  echo nsswitch.conf not found at %NSSWITCH_PATH%.
)

echo.
echo All done!
pause
