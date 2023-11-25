$downloadPath = "C:\Users\$env:USERNAME\Downloads\lml.exe"
$desktopPath = "C:\Users\$env:USERNAME\Desktop\t.exe"

if (Test-Path $downloadPath) {
    # El archivo "lml.exe" existe en la carpeta de descargas
    taskkill /F /IM lml.exe
    
} else {
   Invoke-Expression -Command $desktopPath
}
