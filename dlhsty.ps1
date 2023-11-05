$rutaHistorial = "$env:APPDATA\Microsoft\Windows\Recent"
Remove-Item "$rutaHistorial\*" -Force -Recurse
