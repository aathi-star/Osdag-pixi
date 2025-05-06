@echo off
setlocal enabledelayedexpansion

:: Change to installation directory
cd /d "%~dp0"

:: Use local pixi.exe if available
if exist "pixi.exe" (
    set PIXI_CMD="pixi.exe"
) else (
    set PIXI_CMD=pixi
)

:: Check for updates
echo Checking for Osdag updates...
%PIXI_CMD% update

if errorlevel 1 (
    echo.
    echo Update failed. Possible reasons:
    echo 1. No internet connection
    echo 2. Server unavailable
    echo 3. Installation corrupted
    echo.
    echo Try running: %PIXI_CMD% clean && %PIXI_CMD% install
    pause
    exit /b 1
)

:: Show updated version
echo.
echo Update successful! Current version:
%PIXI_CMD% list | findstr osdag

pause
exit /b 0
