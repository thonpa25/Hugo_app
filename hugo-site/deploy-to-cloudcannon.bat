@echo off
echo.
echo ====================================
echo  CloudCannon Deployment (Windows)
echo ====================================
echo.

cd /d "%~dp0"

echo Deploying to CloudCannon...
node scripts\deploy-cloudcannon.js

pause