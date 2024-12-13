@echo off

REM Modifica el registro para ocultar los iconos del escritorio
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideIcons /t REG_DWORD /d 1 /f

REM Modifica el registro para mover la barra de tareas a la parte superior
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3" /v Settings /t REG_BINARY /d 30000000FFFFFFFFFFFFFFFF01000000 /f

REM Modifica el registro para desactivar el Centro de Notificaciones
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v DisableNotificationCenter /t REG_DWORD /d 1 /f

REM Modificar el registro para mostrar archivos ocultos
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f

REM Modificar el registro para desactivar el Asistente para compartir
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SharingWizardOn /t REG_DWORD /d 0 /f

REM Modificar el registro para mostrar las extensiones de archivos
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f

REM Desactiva el Control de Cuentas de Usuario (UAC)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

REM Desactiva el escritorio seguro para solicitudes UAC
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

REM Desactiva las notificaciones de globos en la barra de tareas
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableBalloonTips /t REG_DWORD /d 0 /f

REM Desactiva la pantalla de bloqueo
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f

REM Habilita la invocación automática del teclado en pantalla en modo escritorio
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\TabletTip\1.7" /v EnableDesktopModeAutoInvoke /t REG_DWORD /d 1 /f

REM Bloquear la ejecución de archivos .msi para el usuario actual
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "DisallowRun" /t REG_DWORD /d "1" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "*.msi" /f

REM Bloquear cualquier intento de ejecución directa del instalador
REG ADD "HKCU\Software\Classes\.msi" /v "" /t REG_SZ /d "" /f

REM Bloquear la instalación pero permitir la ejecución de otros .exe
REM Bloquear archivos de instalación comunes .exe desde el registro
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "1" /t REG_SZ /d "setup.exe" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\DisallowRun" /v "2" /t REG_SZ /d "installer.exe" /f

REM Bloquear la ejecución de archivos .msi
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoRun" /t REG_DWORD /d "1" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "RestrictRun" /t REG_DWORD /d "1" /f

REM Permitir únicamente la ejecución de Kbd.exe y archivos con la extensión .kbd
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun" /v "1" /t REG_SZ /d "Kbd.exe" /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun" /v "2" /t REG_SZ /d "*.kbd" /f

REM Bloquear el acceso al administrador de tareas
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableTaskMgr" /t REG_DWORD /d "1" /f

REM echo Restricciones aplicadas correctamente.

exit