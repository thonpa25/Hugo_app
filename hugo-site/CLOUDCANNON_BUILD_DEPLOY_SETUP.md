# CloudCannon Build Deploy Setup (Updated)

## CloudCannon Has Simplified! 

Based on your screenshot, CloudCannon now uses **Git-based Build Deploys** instead of webhooks. This is actually BETTER and SIMPLER!

---

## ✅ What You Need to Do

### Step 1: Connect Git Provider (From Your Screenshot)

1. **Click** "Select your Git provider" dropdown
2. **Choose** "GitHub"
3. **Click** "Connect and Sync"

### Step 2: Authorize GitHub

When you click "Connect and Sync":
1. CloudCannon will redirect to GitHub
2. Authorize CloudCannon to access your repository
3. Select repository: `thonpa25/Hugo_app`
4. Confirm the connection

### Step 3: Configure Build Settings

After connecting, CloudCannon should auto-detect:
- **Source Path**: `hugo-site/`
- **Build Command**: `hugo --gc --minify`
- **Output Path**: `public`

---

## 🎉 That's It! No Tokens Needed!

CloudCannon's new "Build Deploys" system means:
- ✅ **No webhooks needed**
- ✅ **No tokens needed**
- ✅ **No API keys needed**
- ✅ **Automatic sync from GitHub**

---

## How It Works Now

```
Your Code (Claude Code)
    ↓
git push origin main
    ↓
GitHub Repository
    ↓ (automatic)
CloudCannon Build Deploys
    ↓
Site Updated!
```

---

## Your Deployment Commands Still Work!

Once connected, these commands trigger CloudCannon automatically:

```bash
# Quick sync (recommended)
npm run sync

# Or manual git commands
git add .
git commit -m "Update site"
git push origin main
```

---

## What Happens After Connection

1. **Every push to GitHub** → CloudCannon builds automatically
2. **Every edit in CloudCannon** → Commits to GitHub
3. **Two-way sync** → Always in sync

---

## Build Deploy Features

### Automatic Features:
- ✅ Build on every commit
- ✅ Preview deployments for branches
- ✅ Build logs and history
- ✅ Rollback to previous builds
- ✅ Build notifications

### No Configuration Needed:
- ❌ No build hooks
- ❌ No webhooks
- ❌ No tokens
- ❌ No API keys

---

## Verify Your Setup

After clicking "Connect and Sync":

1. **Check Build Status**:
   - Should show "Building..." then "Success"
   - First build may take 2-3 minutes

2. **Test Deployment**:
   ```bash
   cd hugo-site
   npm run sync
   ```

3. **Check CloudCannon**:
   - Should show new build triggered
   - Site updates automatically

---

## If Connection Issues

### Common Solutions:

1. **Repository Access**:
   - Ensure CloudCannon has access to `thonpa25/Hugo_app`
   - Check GitHub Settings → Applications → CloudCannon

2. **Branch Name**:
   - Make sure CloudCannon is set to `main` branch
   - Not `master` (common issue)

3. **Source Path**:
   - Should be `hugo-site/` (with trailing slash)
   - Not root directory

---

## Current Status

Based on your screenshot:
- ☐ Git provider not connected yet
- ☐ Click "Connect and Sync" to complete

Once connected:
- ✅ Automatic builds enabled
- ✅ GitHub sync active
- ✅ No manual configuration needed

---

## Simple 3-Step Process

1. **Select** "GitHub" from dropdown
2. **Click** "Connect and Sync"
3. **Authorize** CloudCannon

**That's it! No tokens, no webhooks, just Git!**

---

## Your Workflow After Setup

```bash
# Make changes in Claude Code
# Then just run:
npm run sync

# CloudCannon automatically:
# 1. Detects GitHub push
# 2. Pulls changes
# 3. Builds site
# 4. Deploys update
```

---

## Summary

**CloudCannon's Build Deploys is SIMPLER than webhooks:**
- Just connect GitHub once
- Everything else is automatic
- No tokens to manage
- No URLs to configure
- Works perfectly with your existing `npm run sync` command

**Click "Connect and Sync" and you're done!** 🎉