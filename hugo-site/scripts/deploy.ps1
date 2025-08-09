# PowerShell script for Windows users to trigger Netlify deployment
# Usage: .\scripts\deploy.ps1

param(
    [string]$Environment = "production",
    [string]$Message = "Manual deployment triggered from local machine"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Netlify Deployment Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Try to load environment variables from .env file
$envFile = Join-Path $PSScriptRoot ".." ".env"
if (Test-Path $envFile) {
    Write-Host "Loading environment variables from .env file..." -ForegroundColor Gray
    Get-Content $envFile | ForEach-Object {
        if ($_ -match '^([^#][^=]+)=(.*)$') {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim()
            Set-Item -Path "env:$name" -Value $value
        }
    }
}

# Get webhook URL from environment variable
$WEBHOOK_URL = $env:NETLIFY_BUILD_HOOK

# Check if webhook URL is configured
if (-not $WEBHOOK_URL) {
    Write-Host "ERROR: NETLIFY_BUILD_HOOK environment variable not set!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please set up your environment:" -ForegroundColor Yellow
    Write-Host "1. Copy .env.example to .env" -ForegroundColor Yellow
    Write-Host "2. Add your Netlify build hook URL to .env file" -ForegroundColor Yellow
    Write-Host "3. Or set NETLIFY_BUILD_HOOK environment variable" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Example:" -ForegroundColor Gray
    Write-Host '  $env:NETLIFY_BUILD_HOOK = "https://api.netlify.com/build_hooks/YOUR_HOOK_ID"' -ForegroundColor Gray
    exit 1
}

Write-Host "Environment: $Environment" -ForegroundColor Green
Write-Host "Message: $Message" -ForegroundColor Green
Write-Host ""

# Trigger deployment
Write-Host "Triggering Netlify deployment..." -ForegroundColor Yellow

try {
    $response = Invoke-WebRequest -Uri $WEBHOOK_URL -Method POST -UseBasicParsing
    
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Deployment triggered successfully!" -ForegroundColor Green
        Write-Host ""
        
        # Display site URL if available
        if ($env:NETLIFY_SITE_URL) {
            Write-Host "Site URL: $env:NETLIFY_SITE_URL" -ForegroundColor Cyan
        }
        
        Write-Host "Check deployment status at:" -ForegroundColor Cyan
        Write-Host "https://app.netlify.com/sites/YOUR-SITE-NAME/deploys" -ForegroundColor White
    } else {
        Write-Host "⚠️ Unexpected response: $($response.StatusCode)" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Failed to trigger deployment!" -ForegroundColor Red
    Write-Host "Error: $_" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan