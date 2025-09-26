@echo off
:: Chocolatey Menu Runner
:: Save this as run_choco_menu.bat

:: Path to your PowerShell script
set SCRIPT_PATH=%~dp0Script.ps1

:: Check if script exists
if not exist "%SCRIPT_PATH%" (
    echo Script not found: %SCRIPT_PATH%
    pause
    exit /b
)

:: Run PowerShell as Administrator
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "Start-Process PowerShell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%SCRIPT_PATH%""' -Verb RunAs"
