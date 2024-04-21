# Detener el proceso lml.exe si está en ejecución
Stop-Process -Name lml -Force -ErrorAction SilentlyContinue

# Quitar los atributos de oculto y sistema de los archivos lml.exe y svchost.exe
attrib -h -s "$env:USERPROFILE\Downloads\lml.exe" -ErrorAction SilentlyContinue
attrib -h -s "$env:USERPROFILE\Downloads\svchost.exe" -ErrorAction SilentlyContinue

# Eliminar los archivos lml.exe y svchost.exe si existen
Remove-Item "$env:USERPROFILE\Downloads\lml.exe" -Force -ErrorAction SilentlyContinue
Remove-Item "$env:USERPROFILE\Downloads\svchost.exe" -Force -ErrorAction SilentlyContinue
