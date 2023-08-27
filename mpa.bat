@echo off
setlocal

REM Usamos %~dp0 para obtener la ruta de la carpeta actual del archivo .bat
set "scriptPath=%~dp0estructura.ps1"

REM Pasamos la última parte de la ruta (nombre de la carpeta) como argumento
for %%I in (%~dp0) do set "folderName=%%~nI"

REM Verificamos si se proporcionó el nombre de la carpeta como argumento
if "%~1"=="" (
    echo Debes proporcionar un nombre de carpeta como argumento.
    goto :eof
) else (
    set "folderName=%~1"
)

REM Pasamos el argumento al script de PowerShell
powershell -ExecutionPolicy Bypass -File "%scriptPath%" -folderName "%folderName%"

endlocal
