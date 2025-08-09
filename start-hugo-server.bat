@echo off
echo Starting Hugo Development Server...
echo.
echo ============================================
echo Hugo Site will be available at:
echo http://localhost:1313
echo ============================================
echo.
echo Press Ctrl+C to stop the server
echo.

cd /d "C:\Freelancing\Hugo_Website\hugo-site"
..\hugo.exe server --buildDrafts --disableFastRender --bind 0.0.0.0 --port 1313

pause