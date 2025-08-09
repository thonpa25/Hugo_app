Write-Host "Starting Hugo Development Server..." -ForegroundColor Green
Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Hugo Site will be available at:" -ForegroundColor Yellow
Write-Host "http://localhost:1313" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop the server" -ForegroundColor Yellow
Write-Host ""

Set-Location "C:\Freelancing\Hugo_Website\hugo-site"
& "..\hugo.exe" server --buildDrafts --disableFastRender --bind 0.0.0.0 --port 1313