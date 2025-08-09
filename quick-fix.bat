@echo off
echo ========================================
echo Quick CloudCannon Fix Script
echo ========================================
echo.

echo Step 1: Checking current status...
cd hugo-site
git status

echo.
echo Step 2: Pulling latest changes...
git pull origin main

echo.
echo Step 3: Checking theme directory...
dir themes

echo.
echo ========================================
echo Quick checks complete!
echo.
echo To test build, run: check-build.bat
echo To push changes, run: git push origin main
echo ========================================
pause