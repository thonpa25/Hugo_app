@echo off
echo ========================================
echo CloudCannon Build Status Checker
echo ========================================
echo.

REM Pull latest files from CloudCannon
echo Pulling latest files...
cloudcannon files pull

echo.
echo ========================================
echo Running build test...
echo ========================================
cloudcannon run build

echo.
echo ========================================
echo Build check complete!
echo ========================================
pause