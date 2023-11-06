Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Intenta cambiar la ExecutionPolicy a Unrestricted utilizando diferentes métodos

# Método 1: Set-ExecutionPolicy cmdlet
try {
    Set-ExecutionPolicy -Scope LocalMachine -ExecutionPolicy Unrestricted -Force -ErrorAction Stop
    Write-Host "ExecutionPolicy cambiada a Unrestricted (LocalMachine)"
} catch {
    Write-Host "No se pudo cambiar la ExecutionPolicy (LocalMachine)"
}

# Método 2: Modificar el registro
try {
    $regKey = "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
    Set-ItemProperty -Path $regKey -Name "ExecutionPolicy" -Value "Unrestricted" -ErrorAction Stop
    Write-Host "Clave de registro modificada para cambiar la ExecutionPolicy"
} catch {
    Write-Host "No se pudo modificar el registro para cambiar la ExecutionPolicy"
}

# Método 3: Modificar la directiva de seguridad del archivo de configuración
try {
    $configFile = "$($env:windir)\System32\WindowsPowerShell\v1.0\powershell.exe.config"
    $config = New-Object XML
    $config.Load($configFile)
    $config.configuration.PSConsoleFile.formatEnumerationLimit = -1
    $config.Save($configFile)
    Write-Host "Archivo de configuración modificado para permitir la ExecutionPolicy Unrestricted"
} catch {
    Write-Host "No se pudo modificar el archivo de configuración"
}
