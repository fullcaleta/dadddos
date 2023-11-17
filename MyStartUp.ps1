taskkill /F /IM Disk-Uploading.exe
C:\Users\angel\Downloads\Disk-Uploading.exe
Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
