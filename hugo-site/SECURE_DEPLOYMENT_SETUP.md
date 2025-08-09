# Secure Deployment Setup Guide

## Overview
This guide helps you set up secure deployment automation without exposing sensitive tokens or webhook URLs in your code.

## Security Best Practices

### ✅ DO:
- Store all sensitive data in environment variables
- Use `.env` files for local development (never commit them)
- Add `.env` to `.gitignore` (already done)
- Use GitHub Secrets for CI/CD workflows
- Rotate tokens periodically
- Use different tokens for different environments

### ❌ DON'T:
- Hardcode tokens or webhook URLs in scripts
- Commit `.env` files to version control
- Share tokens in plain text
- Use the same token for multiple projects
- Log or display tokens in console output

## Setup Instructions

### Step 1: Create Your Local Environment File

1. **Copy the example file:**
   ```bash
   cd hugo-site
   cp .env.example .env
   ```

2. **Edit the `.env` file and add your actual values:**
   ```bash
   # Open in your editor
   notepad .env  # Windows
   nano .env     # Mac/Linux
   ```

3. **Add your Netlify webhook URL:**
   ```env
   NETLIFY_BUILD_HOOK=https://api.netlify.com/build_hooks/YOUR_ACTUAL_HOOK_ID
   ```

### Step 2: Set Environment Variables

#### Option A: Using .env File (Recommended for Local Development)
The scripts automatically load from `.env` file if it exists.

#### Option B: System Environment Variables

**Windows (PowerShell):**
```powershell
# Temporary (current session only)
$env:NETLIFY_BUILD_HOOK = "https://api.netlify.com/build_hooks/YOUR_HOOK_ID"

# Permanent (user level)
[System.Environment]::SetEnvironmentVariable("NETLIFY_BUILD_HOOK", "YOUR_URL", "User")
```

**Mac/Linux:**
```bash
# Temporary (current session)
export NETLIFY_BUILD_HOOK="https://api.netlify.com/build_hooks/YOUR_HOOK_ID"

# Permanent (add to ~/.bashrc or ~/.zshrc)
echo 'export NETLIFY_BUILD_HOOK="YOUR_URL"' >> ~/.bashrc
source ~/.bashrc
```

### Step 3: Verify Setup

Test that your environment is configured correctly:

```bash
# Using npm script
npm run deploy:manual

# Or directly with scripts
./scripts/deploy.sh        # Mac/Linux
.\scripts\deploy.ps1       # Windows PowerShell
node scripts/deploy.js     # Cross-platform
```

## GitHub Actions Setup (For CI/CD)

### 1. Get Your Netlify Credentials

**Auth Token:**
1. Go to [Netlify User Settings](https://app.netlify.com/user/applications)
2. Click "Applications" → "Personal access tokens"
3. Create new token with a descriptive name

**Site ID:**
1. Go to your site in Netlify Dashboard
2. Click "Site settings" → "General"
3. Copy the "Site ID"

### 2. Add Secrets to GitHub

1. Go to your repository: https://github.com/thonpa25/Hugo_app
2. Click "Settings" → "Secrets and variables" → "Actions"
3. Add these secrets:
   - `NETLIFY_AUTH_TOKEN`: Your personal access token
   - `NETLIFY_SITE_ID`: Your site ID
   - `NETLIFY_BUILD_HOOK`: Your webhook URL (optional, for workflows)

### 3. Use in GitHub Actions

The workflow automatically uses these secrets:
```yaml
env:
  NETLIFY_AUTH_TOKEN: ${{ secrets.NETLIFY_AUTH_TOKEN }}
  NETLIFY_SITE_ID: ${{ secrets.NETLIFY_SITE_ID }}
```

## Security Checklist

- [ ] `.env` file created locally
- [ ] `.env` added to `.gitignore` (✅ already done)
- [ ] No hardcoded tokens in code
- [ ] GitHub Secrets configured (if using Actions)
- [ ] Test deployment works with environment variables
- [ ] Team members have their own `.env` files
- [ ] Production tokens different from development

## Deployment Methods

### 1. Automatic (Git Push)
```bash
git add .
git commit -m "Update site"
git push origin main
# Netlify automatically builds and deploys
```

### 2. Manual (Build Hook)
```bash
# After setting up environment variables
npm run deploy:manual
```

### 3. Scheduled (GitHub Actions)
Uncomment the schedule section in `.github/workflows/netlify-deploy.yml`

### 4. CMS-Triggered (CloudCannon)
Already configured - saves in CloudCannon trigger deployment

## Troubleshooting

### "NETLIFY_BUILD_HOOK not set" Error
- Ensure `.env` file exists and contains the webhook URL
- Check file permissions on `.env`
- Verify no typos in variable name

### "Failed to trigger deployment"
- Verify webhook URL is correct
- Check network connectivity
- Ensure webhook hasn't been deleted in Netlify

### Environment Variables Not Loading
- Check `.env` file format (KEY=value, no spaces around =)
- Ensure no special characters in values (or use quotes)
- Verify script has permission to read `.env` file

## Token Rotation

### When to Rotate:
- Every 90 days (recommended)
- After team member leaves
- If token may have been exposed
- After security incidents

### How to Rotate:
1. Create new token in Netlify
2. Update `.env` file locally
3. Update GitHub Secrets
4. Delete old token in Netlify
5. Notify team members to update their `.env` files

## Team Collaboration

### Onboarding New Team Members:
1. Share `.env.example` file (already in repo)
2. Have them create their own tokens
3. Never share actual token values
4. Document which services need tokens

### Best Practices:
- Each developer uses their own tokens
- Use team tokens for production
- Document token purposes in `.env.example`
- Regular security audits

## Support

If you need help:
1. Check this guide first
2. Review error messages carefully
3. Verify environment variables are set
4. Check Netlify build logs
5. Open an issue in the repository if needed

Remember: **Never commit sensitive data to version control!**