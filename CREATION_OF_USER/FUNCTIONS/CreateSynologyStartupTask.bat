@echo off
SETLOCAL

:: Nombre de la tarea
set "TASK_NAME=SynologyDriveLauncher"

:: Programa a ejecutar
set "PROGRAM_PATH=C:\Program Files (x86)\Synology\SynologyDrive\bin\launcher.exe"

:: Obtener usuario actual
set "CURRENT_USER=%USERNAME%"

echo Creating scheduled task for user: %CURRENT_USER%
echo Program: %PROGRAM_PATH%

:: Eliminar la tarea si ya existe
schtasks /query /tn "%TASK_NAME%" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Task already exists. Deleting...
    schtasks /delete /tn "%TASK_NAME%" /f
)

:: Crear la tarea al iniciar sesión
schtasks /create ^
 /tn "%TASK_NAME%" ^
 /tr "\"%PROGRAM_PATH%\"" ^
 /sc ONLOGON ^
 /ru "%CURRENT_USER%" ^
 /rl HIGHEST ^
 /f

if %ERRORLEVEL% EQU 0 (
    echo Task created successfully.
) else (
    echo ERROR creating task.
)

ENDLOCAL
pause
