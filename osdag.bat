@echo off
setlocal

:: Set the environment path
set ENV_PATH=%~dp0.pixi\envs\default

:: Debug: Show the environment path
echo ENV_PATH is set to: %ENV_PATH%

:: Check if osdag.exe exists
if not exist "%ENV_PATH%\Scripts\osdag.exe" (
    echo ERROR: osdag.exe not found! Make sure the path is correct.
    pause
    exit /b
)


:: Run Osdag and prevent immediate exit
cmd /k "%ENV_PATH%\Scripts\osdag.exe"

endlocal
