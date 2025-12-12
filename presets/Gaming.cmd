@echo off
echo ====================================================
echo    Windows 10 Gaming Optimization Script
echo ====================================================
echo.
echo WARNING: This preset will DISABLE security features:
echo  - Windows Defender
echo  - Windows Firewall
echo  - SmartScreen
echo.
echo Make sure you have a third-party antivirus installed!
echo.
pause
echo.
echo Starting optimization...
@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Win10.ps1" -include "%~dp0..\Win10.psm1" -preset "%~dp0Gaming.preset"
