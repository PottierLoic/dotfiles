@echo off
setlocal

set "GIT_BASE=%USERPROFILE%\AppData\Local\Programs\Git"
set "GIT_BIN=%GIT_BASE%\bin"
set "GIT_USR_BIN=%GIT_BASE%\usr\bin"

echo Checking if Git is installed...
if not exist "%GIT_BIN%\git.exe" (
  echo Git not found. Downloading Git installer...
  powershell -Command "Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.44.0.windows.1/Git-2.44.0-64-bit.exe -OutFile $env:TEMP\GitSetup.exe"
  echo Installing Git silently...
  %TEMP%\GitSetup.exe /SILENT
) else (
  echo Git already installed.
)

set "REGKEY=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
for /f "tokens=3*" %%a in ('reg query "%REGKEY%" /v Path 2^>nul') do set "OLDPATH=%%b"
echo %OLDPATH% | find /I "%GIT_BIN%" >nul
if %errorlevel% neq 0 (
  echo Adding Git to system PATH...
  set "NEWPATH=%OLDPATH%;%GIT_BIN%;%GIT_USR_BIN%"
  reg add "%REGKEY%" /v Path /t REG_EXPAND_SZ /d "%NEWPATH%" /f
  echo PATH updated. You may need to reboot to apply it everywhere.
) else (
  echo Git already in PATH.
)

echo Installing packages via winget...
winget install --id Alacritty.Alacritty --silent --accept-source-agreements --accept-package-agreements
winget install --id GlazeWM.GlazeWM --silent --accept-source-agreements --accept-package-agreements
winget install --id MSYS2.MSYS2 --silent --accept-source-agreements --accept-package-agreements
winget install --id Neovim.Neovim --silent --accept-source-agreements --accept-package-agreements
winget install --id 7zip.7zip --silent --accept-source-agreements --accept-package-agreements
winget install --id Spotify.Spotify --silent --accept-source-agreements --accept-package-agreements
winget install --id Discord.Discord --silent --accept-source-agreements --accept-package-agreements

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
