@echo off
echo ====================================================
echo    Windows 10 Privacy Optimization Script
echo ====================================================
echo.
echo This preset focuses on maximum privacy while
echo keeping security features (Defender, Firewall) enabled.
echo.
pause
echo.
echo Starting optimization...
@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Win10.ps1" -include "%~dp0..\Win10.psm1" -preset "%~dp0Privacy.preset"
