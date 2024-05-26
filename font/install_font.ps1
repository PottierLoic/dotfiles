$fontName = "FiraCode Nerd Font Mono Normal"
$fontNames = (New-Object -ComObject Shell.Application).Namespace(0x14).Items() | Select-Object -ExpandProperty Name
$fontInstalled = $fontNames -contains $fontName

if (-not $fontInstalled) {
  Write-Host "Fira Code font is not installed. Installing..."

  $url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip"
  $output = "FiraCode.zip"
  Invoke-WebRequest -Uri $url -OutFile $output

  $tempDir = New-Item -ItemType Directory -Force -Path "$env:TEMP\FiraCodeFont"
  Expand-Archive -Path $output -DestinationPath $tempDir -Force
  $fontFile = Get-ChildItem "$tempDir\*.ttf" | Where-Object { $_.Name -eq "FiraCodeNerdFontMono-Regular.ttf" }
  if ($fontFile) {
    $fontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)
    $fontsFolder.CopyHere($fontFile.FullName)
  }

  Remove-Item $tempDir -Recurse -Force
  Remove-Item $output -Force

  Write-Host "Fira Code font has been installed."
}
else {
  Write-Host "Fira Code font is already installed."
}
