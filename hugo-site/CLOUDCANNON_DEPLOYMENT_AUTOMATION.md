# CloudCannon Deployment Automation Guide

## Overview
This guide helps you set up fully automated deployment from GitHub to CloudCannon for your Hugo site.

## Current Setup Status
✅ GitHub repository connected to CloudCannon
✅ Hugo site configured with CloudCannon settings
✅ cloudcannon.config.yml already in place

---

## Method 1: Automatic Sync (Recommended)

CloudCannon automatically syncs with your GitHub repository when properly configured.

### Step 1: Enable Auto-Sync in CloudCannon

1. **Log in to CloudCannon**
2. **Go to your site's Settings**
3. **Navigate to "Files" → "Source Syncing"**
4. **Configure GitHub sync:**
   - Repository: `thonpa25/Hugo_app`
   - Branch: `main`
   - Source Path: `hugo-site/` (important!)
   - Enable "Automatic builds"

### Step 2: Set Build Configuration

In CloudCannon Settings → "Builds":

```yaml
Build Configuration:
- Command: hugo --gc --minify
- Output Path: public
- Environment: production
- Hugo Version: 0.129.0
```

### Step 3: Configure Build Hooks

1. **In CloudCannon:**
   - Settings → "Builds" → "Build Hooks"
   - Create a new build hook
   - Copy the webhook URL

2. **In GitHub:**
   - Go to repository Settings
   - Webhooks → Add webhook
   - Paste CloudCannon webhook URL
   - Content type: `application/json`
   - Events: Select "Push events"

---

## Method 2: GitHub Actions Integration

Create `.github/workflows/cloudcannon-deploy.yml`:

```yaml
name: Deploy to CloudCannon

on:
  push:
    branches: [ main ]
    paths:
      - 'hugo-site/**'
  workflow_dispatch:

jobs:
  trigger-cloudcannon:
    runs-on: ubuntu-latest
    
    steps:
    - name: Trigger CloudCannon Build
      run: |
        curl -X POST ${{ secrets.CLOUDCANNON_BUILD_HOOK }} \
          -H "Content-Type: application/json" \
          -d '{"branch":"main"}'
```

### Setup GitHub Secrets:
1. Get build hook from CloudCannon
2. Add to GitHub Secrets as `CLOUDCANNON_BUILD_HOOK`

---

## Method 3: Dual Deployment (Netlify + CloudCannon)

Keep both platforms in sync automatically:

### Update `.github/workflows/dual-deploy.yml`:

```yaml
name: Dual Deployment

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout
      uses: actions/checkout@v3
      with:
        submodules: recursive
    
    - name: Trigger Netlify
      run: |
        curl -X POST ${{ secrets.NETLIFY_BUILD_HOOK }}
    
    - name: Trigger CloudCannon
      run: |
        curl -X POST ${{ secrets.CLOUDCANNON_BUILD_HOOK }}
    
    - name: Notify Success
      run: |
        echo "✅ Deployed to both Netlify and CloudCannon"
```

---

## CloudCannon-Specific Configuration

### Already Configured Files:

1. **cloudcannon.config.yml** ✅
   - Collections configured
   - Data editing enabled
   - Input configurations set

2. **Front Matter Templates** ✅
   - `.cloudcannon/schemas/page.md`
   - `.cloudcannon/schemas/blog-post.md`

3. **Build Scripts** ✅
   - `.cloudcannon/prebuild`
   - `.cloudcannon/postbuild`

---

## Automatic Deployment Flow

### Current Workflow:
```
1. Edit in CloudCannon Visual Editor
   ↓
2. CloudCannon commits to GitHub
   ↓
3. GitHub triggers webhooks
   ↓
4. Both Netlify and CloudCannon rebuild
   ↓
5. Sites updated on both platforms
```

### Alternative Workflow:
```
1. Push to GitHub (from local)
   ↓
2. CloudCannon auto-syncs
   ↓
3. CloudCannon builds automatically
   ↓
4. Site updated on CloudCannon
```

---

## CloudCannon Build Settings

### Recommended Configuration:

```yaml
# In CloudCannon UI Settings:

Source Settings:
  Repository: thonpa25/Hugo_app
  Branch: main
  Path: hugo-site/

Build Settings:
  Command: hugo --gc --minify
  Output: public
  Install Command: npm ci

Environment Variables:
  HUGO_VERSION: 0.129.0
  NODE_VERSION: 18
  HUGO_ENVIRONMENT: production
  TZ: UTC

Build Schedule:
  Automatic: On every commit
  Manual: Available via dashboard
  Scheduled: Optional (e.g., daily at 2 AM)
```

---

## Testing Automation

### Verify Auto-Deploy is Working:

1. **Make a small change:**
   ```bash
   echo "Test update $(date)" >> hugo-site/content/test.md
   git add .
   git commit -m "Test CloudCannon auto-deploy"
   git push origin main
   ```

2. **Check CloudCannon Dashboard:**
   - Look for "Building..." status
   - Should complete in 1-3 minutes

3. **Verify on CloudCannon site:**
   - Check your CloudCannon URL
   - Confirm changes are live

---

## Webhook Management

### CloudCannon Incoming Webhooks:
- Receives from GitHub on push
- Triggers build automatically

### CloudCannon Outgoing Webhooks:
- Can notify Slack/Discord on build
- Can trigger other services

### Setup Status Notifications:

1. **In CloudCannon Settings:**
   - Builds → Notifications
   - Add notification service
   - Configure for success/failure

---

## Troubleshooting

### Build Not Triggering:
1. Check webhook in GitHub (should show green checkmark)
2. Verify branch name matches (main vs master)
3. Check CloudCannon build logs

### Build Failing:
1. Check Hugo version matches
2. Verify submodules are accessible
3. Check build command syntax
4. Review CloudCannon build logs

### Sync Issues:
1. Reconnect GitHub repository
2. Check repository permissions
3. Verify source path is correct

---

## Best Practices

### For CloudCannon:
1. **Use Visual Editor** for content changes
2. **Commit messages** should be descriptive
3. **Preview** before publishing
4. **Use drafts** for work in progress

### For Automation:
1. **Test locally** before pushing
2. **Monitor build status** regularly
3. **Set up notifications** for failures
4. **Keep build times** under 5 minutes

---

## Quick Commands

### Trigger Manual Build:
```bash
# Using webhook
curl -X POST https://app.cloudcannon.com/hooks/[YOUR_HOOK_ID]

# Using CloudCannon CLI (if installed)
cloudcannon build
```

### Check Status:
- CloudCannon Dashboard: https://app.cloudcannon.com
- Build history: Settings → Builds → History
- Current status: Top of dashboard

---

## Multi-Environment Setup

### Production (CloudCannon):
- Auto-deploys from `main` branch
- Public-facing site
- Visual editing enabled

### Staging (Netlify):
- Auto-deploys from `main` branch
- Testing and preview
- Build previews for PRs

### Development (Local):
```bash
cd hugo-site
hugo server -D
```

---

## Summary

Your CloudCannon deployment automation is configured with:

✅ **Automatic sync** from GitHub repository
✅ **Auto-build** on every commit
✅ **Visual editing** that triggers rebuilds
✅ **Webhook integration** with GitHub
✅ **Dual deployment** to Netlify and CloudCannon

**No additional configuration needed** - CloudCannon will automatically build and deploy whenever:
1. You push to GitHub
2. You edit in CloudCannon
3. Someone merges a PR

The site updates automatically within 1-3 minutes of any change!