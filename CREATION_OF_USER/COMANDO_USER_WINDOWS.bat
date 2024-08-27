@echo off

set username=ursposuser

REM Check if the user already exists
net user %username% > nul 2>&1
if %errorlevel% equ 0 (
    echo The user %username% already exists. No action will be taken.
    exit /b
) else (
    echo Creating user...
    net user %username% /add
    echo User created successfully.

    REM Add the user to the Administrators group
    net localgroup Administrators %username% /add
    echo The user %username% has been added to the Administrators group.
)

REM This command checks access to the registry editor and verifies if there is a user with AutoAdminLogon; if not, it creates one
REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon | find /i "0x1"

REM It's important to modify DefaultUserName and DefaultPassword to the standard user created in autologin.reg
IF %ERRORLEVEL% EQU 0 (
    echo User already configured for automatic login. No action will be taken.
) ELSE (
    regedit /s "C:\ConfigLoginAplicationURS\CREATION_OF_USER\REGEDIT\autologin.reg"
)

REM Create a scheduled task to run the BAT script at login for the user ursposuser
schtasks /create /tn "ApplyTaskbarSettings" /tr "C:\ConfigLoginAplicationURS\CREATION_OF_USER\FUNCTIONS\ApplyTaskbarSettings.bat" /sc onlogon /ru %username% /rl highest

REM Create the scheduled task to run ConfigLoginAplicationURS.exe at login for the user ursposuser
schtasks /create /tn "RunConfigLoginAppForUser" /tr "C:\ConfigLoginAplicationURS\APLICATION\ConfigLoginAplicationURS.exe" /sc onlogon /ru ursposuser /rl highest

echo Scheduled task created successfully for %username%.

echo Restarting the PC in 5 seconds...
timeout /t 5 /nobreak > nul
shutdown /r /t 0