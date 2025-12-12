@echo off
echo ====================================================
echo    Windows 10 Balanced Optimization Script
echo ====================================================
echo.
echo This preset offers a balanced approach:
echo  - Good privacy
echo  - Decent performance
echo  - Security features enabled
echo.
echo Recommended for most users.
echo.
pause
echo.
echo Starting optimization...
@powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0..\Win10.ps1" -include "%~dp0..\Win10.psm1" -preset "%~dp0Balanced.preset"
