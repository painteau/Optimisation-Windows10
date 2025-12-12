@echo off
echo ====================================================
echo    Windows 10 Settings Backup Tool
echo ====================================================
echo.
echo This tool will create a backup of your current
echo Windows settings, including:
echo  - Registry keys
echo  - Installed applications list
echo  - Services status
echo  - System restore point
echo.
pause
@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0Backup-Settings.ps1"
