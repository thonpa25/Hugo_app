# Netlify Deployment Automation Guide

## Overview
This guide covers all methods to automate your Hugo site deployment to Netlify, from basic automatic Git deployments to advanced CI/CD pipelines.

## Table of Contents
1. [Basic Automatic Deployment](#1-basic-automatic-deployment)
2. [Deploy Hooks for External Triggers](#2-deploy-hooks)
3. [GitHub Actions Integration](#3-github-actions-integration)
4. [Netlify CLI Automation](#4-netlify-cli-automation)
5. [Build Hooks & Webhooks](#5-build-hooks--webhooks)
6. [Scheduled Deployments](#6-scheduled-deployments)
7. [Content-Triggered Deployments](#7-content-triggered-deployments)

---

## 1. Basic Automatic Deployment

### Already Configured ✅
Your site is already set up for automatic deployment on every Git push:

```yaml
# netlify.toml (already configured)
[build]
  command = "hugo --gc --minify"
  publish = "public"
```

### How It Works
1. **Push to GitHub** → Netlify detects change → Builds automatically → Deploys to production
2. **Pull Requests** → Creates preview deployments automatically
3. **Branch Pushes** → Creates branch deployments

### Verify Setup
1. Go to Netlify Dashboard → Site Settings → Build & Deploy
2. Ensure "Auto publishing" is enabled
3. Check "Build hooks" section for webhook URL

---

## 2. Deploy Hooks

### Create a Deploy Hook
1. **In Netlify Dashboard:**
   - Site Settings → Build & Deploy → Build hooks
   - Click "Add build hook"
   - Name it (e.g., "Manual Deploy", "CMS Deploy")
   - Select branch (usually "main")

2. **Use the Hook:**
```bash
# Trigger deployment via curl
curl -X POST https://api.netlify.com/build_hooks/YOUR_HOOK_ID

# Or via PowerShell (Windows)
Invoke-WebRequest -Uri "https://api.netlify.com/build_hooks/YOUR_HOOK_ID" -Method POST
```

### Example: Deploy Script
Create `deploy.sh` (or `deploy.ps1` for Windows):

```bash
#!/bin/bash
# deploy.sh
echo "Triggering Netlify deployment..."
curl -X POST https://api.netlify.com/build_hooks/YOUR_HOOK_ID
echo "Deployment triggered successfully!"
```

```powershell
# deploy.ps1 (Windows PowerShell)
Write-Host "Triggering Netlify deployment..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://api.netlify.com/build_hooks/YOUR_HOOK_ID" -Method POST
Write-Host "Deployment triggered successfully!" -ForegroundColor Green
```

---

## 3. GitHub Actions Integration

### Create GitHub Action for Advanced Automation

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Netlify

on:
  # Automatic triggers
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
  
  # Manual trigger
  workflow_dispatch:
  
  # Scheduled trigger (daily at 2 AM UTC)
  schedule:
    - cron: '0 2 * * *'

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: recursive  # Important for Hugo themes
    
    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2
      with:
        hugo-version: '0.129.0'
        extended: true
    
    - name: Build Hugo Site
      run: hugo --gc --minify
    
    - name: Deploy to Netlify
      uses: nwtgck/actions-netlify@v2.0
      with:
        publish-dir: './hugo-site/public'
        production-branch: main
        github-token: ${{ secrets.GITHUB_TOKEN }}
        deploy-message: "Deploy from GitHub Actions"
        enable-pull-request-comment: true
        enable-commit-comment: true
        overwrites-pull-request-comment: true
      env:
        NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
        NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
      timeout-minutes: 1
```

### Setup GitHub Secrets
1. Get Netlify Auth Token:
   - Go to Netlify → User Settings → Applications → Personal Access Tokens
   - Create new token
   
2. Get Site ID:
   - Netlify Dashboard → Site Settings → General → Site ID

3. Add to GitHub:
   - Repository → Settings → Secrets → Actions
   - Add `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID`

---

## 4. Netlify CLI Automation

### Install Netlify CLI
```bash
npm install -g netlify-cli
```

### Login to Netlify
```bash
netlify login
```

### Link Your Site
```bash
cd hugo-site
netlify link
```

### Automated Deployment Commands

```bash
# Deploy to production
netlify deploy --prod --dir=public

# Deploy preview
netlify deploy --dir=public

# Build and deploy
hugo --gc --minify && netlify deploy --prod --dir=public

# Watch for changes and auto-deploy
netlify dev
```

### Create npm Scripts
Update `package.json`:

```json
{
  "scripts": {
    "build": "hugo --gc --minify",
    "deploy": "npm run build && netlify deploy --prod --dir=public",
    "deploy:preview": "npm run build && netlify deploy --dir=public",
    "dev": "hugo server -D",
    "netlify:dev": "netlify dev"
  }
}
```

Then use:
```bash
npm run deploy          # Deploy to production
npm run deploy:preview  # Deploy preview
npm run netlify:dev     # Local development with Netlify features
```

---

## 5. Build Hooks & Webhooks

### CloudCannon Integration (Already Configured)
Your CloudCannon CMS can trigger deployments automatically:

1. **In CloudCannon:**
   - Settings → Hosting → Add Netlify webhook
   - Paste your Netlify build hook URL

2. **Auto-deploy on content changes:**
   - CloudCannon saves → Webhook triggers → Netlify builds

### Custom Webhook Integration

```javascript
// webhook-deploy.js
const https = require('https');

function triggerDeploy() {
  const options = {
    hostname: 'api.netlify.com',
    path: '/build_hooks/YOUR_HOOK_ID',
    method: 'POST'
  };

  const req = https.request(options, (res) => {
    console.log(`Deployment triggered: ${res.statusCode}`);
  });

  req.on('error', (e) => {
    console.error(`Problem: ${e.message}`);
  });

  req.end();
}

// Trigger on file change, API call, etc.
triggerDeploy();
```

---

## 6. Scheduled Deployments

### Using GitHub Actions (Recommended)
Add to `.github/workflows/scheduled-deploy.yml`:

```yaml
name: Scheduled Deploy

on:
  schedule:
    # Every day at midnight UTC
    - cron: '0 0 * * *'
    # Every Monday at 9 AM UTC
    - cron: '0 9 * * 1'
    # First day of month at noon UTC
    - cron: '0 12 1 * *'

jobs:
  trigger-netlify:
    runs-on: ubuntu-latest
    steps:
      - name: Trigger Netlify Build
        run: |
          curl -X POST ${{ secrets.NETLIFY_BUILD_HOOK }}
```

### Using External Services

#### Cron-job.org (Free)
1. Sign up at https://cron-job.org
2. Create new job:
   - URL: Your Netlify build hook
   - Schedule: Your desired schedule
   - Method: POST

#### Zapier/IFTTT Integration
1. Create trigger (time-based, RSS feed, etc.)
2. Action: Webhook POST to Netlify build hook

---

## 7. Content-Triggered Deployments

### CMS Webhooks (CloudCannon)
Already configured in your `cloudcannon.config.yml`

### API-Triggered Deployments

```python
# Python example
import requests

def deploy_site():
    webhook_url = "https://api.netlify.com/build_hooks/YOUR_HOOK_ID"
    response = requests.post(webhook_url)
    if response.status_code == 200:
        print("Deployment triggered!")
    else:
        print(f"Error: {response.status_code}")

# Trigger on content update
deploy_site()
```

```javascript
// Node.js example
const axios = require('axios');

async function deploySite() {
  try {
    const response = await axios.post('https://api.netlify.com/build_hooks/YOUR_HOOK_ID');
    console.log('Deployment triggered!');
  } catch (error) {
    console.error('Deployment failed:', error);
  }
}

// Trigger on content update
deploySite();
```

---

## 8. Advanced Automation Scenarios

### Multi-Environment Deployment

```yaml
# .github/workflows/multi-env-deploy.yml
name: Multi-Environment Deploy

on:
  push:
    branches:
      - main        # → Production
      - staging     # → Staging
      - develop     # → Development

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Determine Environment
        id: env
        run: |
          if [ "${{ github.ref }}" == "refs/heads/main" ]; then
            echo "environment=production" >> $GITHUB_OUTPUT
          elif [ "${{ github.ref }}" == "refs/heads/staging" ]; then
            echo "environment=staging" >> $GITHUB_OUTPUT
          else
            echo "environment=development" >> $GITHUB_OUTPUT
          fi
      
      - name: Deploy to Netlify
        run: |
          curl -X POST ${{ secrets[format('NETLIFY_HOOK_{0}', steps.env.outputs.environment)] }}
```

### Content-Based Conditional Deployment

```bash
#!/bin/bash
# conditional-deploy.sh

# Check if content files changed
if git diff --name-only HEAD~1 | grep -q "content/"; then
  echo "Content changed, triggering deployment..."
  curl -X POST $NETLIFY_BUILD_HOOK
else
  echo "No content changes, skipping deployment"
fi
```

---

## 9. Monitoring & Notifications

### Netlify Build Notifications
1. **Email Notifications:**
   - Site Settings → Build & Deploy → Deploy notifications
   - Add email notifications for success/failure

2. **Slack Integration:**
   - Add Slack webhook URL for build notifications

3. **Custom Webhooks:**
   - Add webhook URLs for build status updates

### Build Status Badge
Add to your README.md:

```markdown
[![Netlify Status](https://api.netlify.com/api/v1/badges/YOUR-SITE-ID/deploy-status)](https://app.netlify.com/sites/YOUR-SITE-NAME/deploys)
```

---

## 10. Best Practices

### Security
- Store sensitive data in environment variables
- Use secrets for API tokens
- Rotate webhook URLs periodically
- Limit build hook access

### Performance
- Use build caching (already configured)
- Optimize Hugo build times
- Avoid unnecessary rebuilds
- Use incremental builds when possible

### Reliability
- Set up build notifications
- Monitor build times and failures
- Have fallback deployment methods
- Keep build logs for debugging

---

## Quick Reference

### Essential Commands
```bash
# Manual deploy via CLI
netlify deploy --prod

# Trigger via webhook
curl -X POST https://api.netlify.com/build_hooks/YOUR_HOOK_ID

# Check deployment status
netlify status

# View recent deploys
netlify deploys:list

# Rollback to previous deploy
netlify deploys:restore [deploy-id]
```

### Environment Variables
Set in Netlify Dashboard → Site Settings → Environment Variables:
- `HUGO_VERSION`: 0.129.0
- `NODE_VERSION`: 18
- `HUGO_ENVIRONMENT`: production
- Custom variables for your site

---

## Troubleshooting

### Common Issues

1. **Build Fails:**
   - Check Hugo version matches
   - Verify submodules are initialized
   - Check build logs in Netlify

2. **Webhook Not Triggering:**
   - Verify webhook URL is correct
   - Check for rate limiting
   - Ensure branch settings are correct

3. **Slow Builds:**
   - Enable build caching
   - Optimize asset sizes
   - Use incremental builds

### Getting Help
- Netlify Support: https://answers.netlify.com
- Hugo Forums: https://discourse.gohugo.io
- GitHub Issues: Your repository issues

---

## Next Steps

1. **Set up build hooks** for manual triggers
2. **Configure GitHub Actions** for advanced automation
3. **Add build notifications** for monitoring
4. **Implement scheduled deployments** if needed
5. **Set up staging environments** for testing

Your site is already configured for basic automatic deployment. Choose additional automation methods based on your workflow needs!