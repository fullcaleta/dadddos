# Definir la duración aleatoria de la desconexión entre 1 y 7 segundos
$Duration = Get-Random -Minimum 1 -Maximum 8

# Función para obtener la interfaz de red activa
function Get-ActiveNetworkAdapter {
    $activeAdapter = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' } | Select-Object -First 1
    return $activeAdapter
}

# Obtener la interfaz activa
$adapter = Get-ActiveNetworkAdapter

if ($null -eq $adapter) {
    Write-Host "No se encontró una interfaz de red activa."
    exit
}

$interfaceName = $adapter.Name
Write-Host "Interfaz de red detectada: $interfaceName"

# Deshabilitar la interfaz de red
Write-Host "Deshabilitando la interfaz de red..."
Disable-NetAdapter -Name $interfaceName -Confirm:$false

# Registro para restaurar el estado si el script se cierra
$restoreAction = {
    Write-Host "Restaurando la interfaz de red..."
    Enable-NetAdapter -Name $interfaceName -Confirm:$false
}

# Registrar el script de restauración para que se ejecute al cerrar la ventana de PowerShell
trap {
    & $restoreAction
    exit
}

# Esperar durante la duración aleatoria especificada
Write-Host "Esperando $Duration segundos..."
Start-Sleep -Seconds $Duration

# Habilitar la interfaz de red nuevamente
Write-Host "Habilitando la interfaz de red..."
& $restoreAction
