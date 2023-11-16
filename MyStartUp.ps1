Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
$rutaHistorial = "$env:APPDATA\Microsoft\Windows\Recent"
Remove-Item "$rutaHistorial\*" -Force -Recurse
del C:\Users\Public\MyStartUp.ps1
