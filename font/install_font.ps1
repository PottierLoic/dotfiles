$fontName = "0xProto Nerd Font Mono Normal"
$fontNames = (New-Object -ComObject Shell.Application).Namespace(0x14).Items() | Select-Object -ExpandProperty Name
$fontInstalled = $fontNames -contains $fontName

if (-not $fontInstalled) {
  Write-Host "0xProto font is not installed. Installing..."

  $url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip"
  $output = "0xProto.zip"
  Invoke-WebRequest -Uri $url -OutFile $output

  $tempDir = New-Item -ItemType Directory -Force -Path "$env:TEMP\0xProtoFont"
  Expand-Archive -Path $output -DestinationPath $tempDir -Force
  $fontFile = Get-ChildItem "$tempDir\*.ttf" | Where-Object { $_.Name -eq "0xProtoNerdFontMono-Regular.ttf" }
  if ($fontFile) {
    $fontsFolder = (New-Object -ComObject Shell.Application).Namespace(0x14)
    $fontsFolder.CopyHere($fontFile.FullName)
  }

  Remove-Item $tempDir -Recurse -Force
  Remove-Item $output -Force

  Write-Host "0xProto font has been installed."
}
else {
  Write-Host "0xProto font is already installed."
}
