@echo off
echo ========================================
echo Testing Netlify Build Locally
echo ========================================
echo.

cd hugo-site

echo Checking configuration...
if exist hugo.yaml (
    echo ✓ hugo.yaml found
) else (
    echo ✗ hugo.yaml NOT found
)

echo.
echo Checking theme...
if exist themes\bigspring (
    echo ✓ Theme 'bigspring' found
) else (
    echo ✗ Theme 'bigspring' NOT found
)

echo.
echo Running Hugo build (like Netlify would)...
..\hugo.exe --gc --minify

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo ✓ BUILD SUCCESSFUL - Netlify should work!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo ✗ BUILD FAILED - Netlify might fail too
    echo ========================================
)

pause