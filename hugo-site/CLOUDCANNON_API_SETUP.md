# CloudCannon API & Authentication Guide

## CloudCannon vs Netlify Authentication

### Netlify Approach:
- ✅ Simple webhook URL (what you have)
- ✅ No authentication needed for build hooks
- ✅ One URL triggers deployment

### CloudCannon Approach:
- 🔄 Git-based sync (primary method)
- 🔑 Personal Access Tokens (for API)
- 🪝 Webhooks (for triggering builds)

---

## Authentication Methods for CloudCannon

### Method 1: Git Sync (Currently Active) ✅
**How it works:**
- Push to GitHub → CloudCannon auto-syncs
- No token needed!
- Already configured and working

**This is what you're using now:**
```bash
git push origin main
# CloudCannon automatically detects and syncs
```

---

### Method 2: CloudCannon Build Hooks (Similar to Netlify)

**To create a build hook:**

1. **Log in to CloudCannon**
2. **Go to:** Site Settings → Hosting → Build Hooks
3. **Click:** "Add Build Hook"
4. **Name it:** "Claude Code Deployment"
5. **Copy the URL** (looks like):
   ```
   https://app.cloudcannon.com/api/v1/hooks/YOUR_HOOK_ID
   ```

6. **Add to your .env file:**
   ```env
   CLOUDCANNON_BUILD_HOOK=https://app.cloudcannon.com/api/v1/hooks/YOUR_HOOK_ID
   ```

**Usage:**
```bash
# Trigger build directly
curl -X POST $CLOUDCANNON_BUILD_HOOK
```

---

### Method 3: CloudCannon Personal Access Token (Advanced)

**For full API access:**

1. **Get your token:**
   - Go to: https://app.cloudcannon.com/me/account
   - Click "Personal Access Tokens"
   - Create new token
   - Name: "Claude Code Integration"
   - Permissions: Select "Sites: Read & Write"

2. **Add to .env:**
   ```env
   CLOUDCANNON_API_TOKEN=your_token_here
   CLOUDCANNON_SITE_ID=your_site_id
   ```

3. **Find your Site ID:**
   - CloudCannon Dashboard → Site Settings → General
   - Look for "Site ID" (UUID format)

---

## Setting Up Build Hooks (Recommended)

Since you want something similar to Netlify, let's set up CloudCannon build hooks:

### Step 1: Create Build Hook in CloudCannon
1. Log in to CloudCannon
2. Select your site
3. Go to: **Settings → Hosting → Build Hooks**
4. Click **"Add Build Hook"**
5. Name: **"Claude Code Deploy"**
6. Copy the webhook URL

### Step 2: Update Your .env File
```env
# Netlify (already have)
NETLIFY_BUILD_HOOK=https://api.netlify.com/build_hooks/6896c1f110673fda631dae2d

# CloudCannon (add this)
CLOUDCANNON_BUILD_HOOK=https://app.cloudcannon.com/api/v1/hooks/YOUR_HOOK_ID
```

### Step 3: Test It
```bash
# Test CloudCannon hook
curl -X POST $CLOUDCANNON_BUILD_HOOK

# Or use the script
npm run deploy:cloudcannon
```

---

## Comparison Table

| Feature | Netlify | CloudCannon |
|---------|---------|-------------|
| Build Hooks | ✅ Simple URL | ✅ Simple URL |
| Auth Required | ❌ No | ❌ No (for hooks) |
| Git Sync | ✅ Auto | ✅ Auto |
| API Token | ✅ Available | ✅ Available |
| Webhook Format | `/build_hooks/ID` | `/api/v1/hooks/ID` |

---

## Current Setup Status

### What You Have Now:
- ✅ **Git-based sync** (working)
- ✅ **GitHub webhook** (if configured)
- ⏳ **Build hook** (optional, not required)

### What's Working:
```bash
# This already triggers CloudCannon
git push origin main

# Or use the script
npm run sync
```

---

## Quick Setup Commands

If you want to add a CloudCannon build hook:

```bash
# 1. Get the hook URL from CloudCannon dashboard
# 2. Add to .env file:
echo "CLOUDCANNON_BUILD_HOOK=https://app.cloudcannon.com/api/v1/hooks/YOUR_ID" >> .env

# 3. Test it:
curl -X POST $(grep CLOUDCANNON_BUILD_HOOK .env | cut -d '=' -f2)
```

---

## Do You Need a Token?

**Short answer: No!**

- **Git sync works without tokens** ✅
- **Build hooks work without tokens** ✅
- **Visual editing works without tokens** ✅

**Tokens are only needed if you want to:**
- Use CloudCannon API directly
- Manage sites programmatically
- Access advanced features

---

## Recommended Approach

**For Claude Code, stick with Git sync:**

1. **It's already working**
2. **No tokens to manage**
3. **Most reliable method**
4. **GitHub is the source of truth**

**Your current workflow is perfect:**
```bash
npm run sync
# Git push → GitHub → CloudCannon syncs automatically
```

---

## Summary

**CloudCannon doesn't require tokens for basic deployment!**

Your current setup using Git sync is:
- ✅ More secure (no tokens to leak)
- ✅ More reliable (Git is source of truth)
- ✅ Already working perfectly

If you want Netlify-style webhooks, you can add build hooks, but they're optional since Git sync is already handling everything automatically!