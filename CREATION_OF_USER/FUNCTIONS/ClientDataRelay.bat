@echo off
rem Script para ejecutar el acceso directo ClientDataRelayTest.lnk

rem Ruta del acceso directo
set shortcut_path="C:\Users\USER_1\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\ClientDataRelayTest.lnk"

rem Ejecutar el acceso directo
start "" %shortcut_path%

rem Cerrar el script
exit
