@echo off
echo ====================================================
echo    Windows 10 Settings Restore Tool
echo ====================================================
echo.
echo This tool will restore Windows settings from a
echo previously created backup.
echo.
pause
@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Restore-Settings.ps1"
