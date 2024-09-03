@echo off
REM Define the full path of the wallpaper images (JPG and PNG formats)
set wallpaper_jpg=C:\URS-KIOSK\CREATION_OF_USER\FUNCTIONS\IMG\urs.jpg
set wallpaper_png=C:\URS-KIOSK\CREATION_OF_USER\FUNCTIONS\IMG\urs.png

REM Check if the JPG file exists
if exist "%wallpaper_jpg%" (
    set wallpaper=%wallpaper_jpg%
    set wallpaper_ext=jpg
) else (
    REM If JPG doesn't exist, check if the PNG file exists
    if exist "%wallpaper_png%" (
        set wallpaper=%wallpaper_png%
        set wallpaper_ext=png
    ) else (
        echo No wallpaper file found.
        pause
        exit /b
    )
)

REM Copy the wallpaper image to the Windows directory
copy "%wallpaper%" "%SystemRoot%\Web\Wallpaper\Windows\custom_wallpaper.%wallpaper_ext%" /Y

REM Modify the registry for the current user
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%SystemRoot%\Web\Wallpaper\Windows\custom_wallpaper.%wallpaper_ext%" /f

REM Set the wallpaper style for the current user (2 = fit, 0 = center, 6 = fill, etc.)
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d 0 /f

REM Set the wallpaper style for the default user
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d 2 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d 0 /f

REM Force the wallpaper update for the current user
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters ,1 ,True
