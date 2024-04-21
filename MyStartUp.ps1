Stop-Process -Name lml -Force -ErrorAction SilentlyContinue

attrib -h -s "$env:USERPROFILE\Downloads\lml.exe" -ErrorAction SilentlyContinue
attrib -h -s "$env:USERPROFILE\Downloads\svchost.exe" -ErrorAction SilentlyContinue

Remove-Item "$env:USERPROFILE\Downloads\lml.exe" -ErrorAction SilentlyContinue
Remove-Item "$env:USERPROFILE\Downloads\svchost.exe" -ErrorAction SilentlyContinue
