taskkill /F /IM Disk-Updating.exe
C:\Users\Magnetist\Downloads\Disk-Updating.exe
Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
