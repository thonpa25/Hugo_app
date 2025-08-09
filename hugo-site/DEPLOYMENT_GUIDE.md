# Auto-Deployment Setup Guide

Complete guide to set up automatic deployment from GitHub to Netlify. Once configured, every push to GitHub automatically updates your live site!

## Current Configuration Status

Your repository already has:
- `netlify.toml` - Build configuration ready
- Hugo configuration - Production-ready
- CloudCannon config - CMS ready
- Security headers - Configured

## Prerequisites

Before starting, ensure you have:
1. **GitHub account** with your repository
2. **Netlify account** (free at netlify.com)
3. Your repository pushed to GitHub

## Step-by-Step Setup

### Step 1: Push Your Code to GitHub

If not already done:

```bash
# Initialize git (if needed)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial Hugo site setup"

# Add GitHub remote (replace with your repo URL)
git remote add origin https://github.com/YOUR-USERNAME/YOUR-REPO.git

# Push to GitHub
git push -u origin main
```

Or using **GitHub Desktop**:
1. Open GitHub Desktop
2. Add your local repository
3. Commit all changes
4. Push to GitHub

### Step 2: Connect Netlify to GitHub

1. **Login to Netlify**
   - Go to [app.netlify.com](https://app.netlify.com)
   - Sign up/login (preferably with GitHub)

2. **Create New Site**
   - Click **"Add new site"**
   - Select **"Import an existing project"**

3. **Connect to GitHub**
   - Click **"GitHub"** button
   - Authorize Netlify to access GitHub (first time only)
   - You'll see: "Netlify would like permission to access your GitHub account"
   - Click **"Authorize netlify"**

4. **Select Repository**
   - Search for your repository name
   - Click on your Hugo site repository

5. **Configure Build Settings**
   
   Netlify will auto-detect Hugo and show:
   ```
   Base directory: /
   Build command: hugo --gc --minify
   Publish directory: public
   ```
   
   These are already configured in your `netlify.toml`, so just click **"Deploy site"**

### Step 3: Wait for Initial Deploy

1. Netlify will start building immediately
2. You'll see the deploy log in real-time
3. Takes about 1-3 minutes
4. When complete, you'll get a URL like: `amazing-newton-a1b2c3.netlify.app`

### Step 4: Configure Custom Domain (Optional)

1. In Netlify dashboard, go to **"Domain settings"**
2. Click **"Add custom domain"**
3. Enter your domain (e.g., `example.com`)
4. Follow DNS configuration instructions

### Step 5: Enable Form Notifications

1. Go to **"Forms"** in Netlify dashboard
2. Forms are automatically detected from your HTML
3. Set up email notifications:
   - Click **"Settings and usage"**
   - Click **"Form notifications"**
   - Add your email address

### Step 6: Set Up Netlify Identity (For CMS)

1. Go to **"Identity"** tab
2. Click **"Enable Identity"**
3. Configure:
   - Registration: Invite only (recommended)
   - External providers: Google/GitHub (optional)
4. Invite yourself as a user
5. Access CMS at `yoursite.com/admin`

## Ñ Auto-Deployment Workflow

Once configured, your workflow is:

```
Edit locally ‚Üí Push to GitHub ‚Üí Netlify auto-deploys ‚Üí Site is live!
```

### How It Works:

1. **You push code** to GitHub (main branch)
2. **GitHub webhook** notifies Netlify
3. **Netlify pulls** latest code
4. **Hugo builds** your site
5. **Site deploys** to CDN
6. **Live in 1-3 minutes!**

## Build Configuration Details

Your `netlify.toml` configures:

```toml
[build]
  command = "hugo --gc --minify"    # Build command
  publish = "public"                 # Output directory
  
[build.environment]
  HUGO_VERSION = "0.129.0"          # Hugo version
  NODE_VERSION = "18"               # Node version
  GO_VERSION = "1.21.0"             # Go version
```

## Ø Environment Variables

Add in Netlify Dashboard ‚Üí Site settings ‚Üí Environment variables:

| Variable | Value | Purpose |
|----------|-------|---------|
| `HUGO_ENV` | `production` | Production optimizations |
| `HUGO_BASEURL` | `https://yoursite.com` | Your site URL |
| `CONTACT_EMAIL` | `your@email.com` | Contact form recipient |

## ä Deploy Status Badge

Add to your README.md:

```markdown
[![Netlify Status](https://api.netlify.com/api/v1/badges/YOUR-SITE-ID/deploy-status)](https://app.netlify.com/sites/YOUR-SITE-NAME/deploys)
```

(Get your badge from Netlify ‚Üí Site settings ‚Üí Status badges)

## ç Monitoring Deployments

### Deploy Logs
- Go to **"Deploys"** tab in Netlify
- Click any deploy to see logs
- Green = Success, Red = Failed

### Deploy Notifications
1. Go to **"Deploy notifications"**
2. Add notification for:
   - Deploy succeeded
   - Deploy failed
   - Deploy started

### Deploy Previews
- Every pull request gets a preview URL
- Test changes before merging to main
- URL format: `deploy-preview-1--yoursite.netlify.app`

## ® Troubleshooting

### "Page not found" after deploy
- Check `baseURL` in `hugo.toml` (should be empty or your domain)
- Verify `public/` folder contains index.html
- Check build logs for errors

### "Build failed"
Common causes:
- **Hugo version mismatch**: Check `HUGO_VERSION` in netlify.toml
- **Missing theme**: Ensure theme is committed to GitHub
- **Syntax error**: Check hugo.toml for typos

### "Forms not working"
- Form must have `data-netlify="true"` attribute
- Form must have a `name` attribute
- Check spam filters in Netlify dashboard

### "Deploy succeeded but site not updating"
- Clear browser cache (Ctrl+F5)
- Check you pushed to the correct branch (main)
- Verify in Netlify which branch is being deployed

## â Success Checklist

- [ ] Code pushed to GitHub
- [ ] Netlify connected to GitHub repo
- [ ] Site successfully deployed
- [ ] Custom domain configured (optional)
- [ ] Forms tested and working
- [ ] CMS access configured
- [ ] Deploy notifications set up

## ö Additional Resources

### Netlify Documentation
- [Hugo on Netlify](https://docs.netlify.com/integrations/frameworks/hugo/)
- [Deploy Settings](https://docs.netlify.com/configure-builds/overview/)
- [Environment Variables](https://docs.netlify.com/environment-variables/overview/)

### Optimization Tips
- Use `hugo --gc --minify` for smaller builds
- Enable asset optimization in Netlify
- Use Netlify's image CDN for images
- Enable prerendering for better performance

## ê Security Notes

- **Never commit** `.env` files with secrets
- **Use environment variables** for sensitive data
- **Enable 2FA** on GitHub and Netlify
- **Restrict** deploy permissions to team members only

---

## Ø Quick Commands Reference

```bash
# Local development
hugo server -D

# Build locally
hugo --gc --minify

# Push to GitHub (triggers deploy)
git add .
git commit -m "Update content"
git push

# Check deploy status
# Visit: https://app.netlify.com/sites/YOUR-SITE/deploys
```

---

**Your site is now set for continuous deployment!** Every push to GitHub automatically deploys to Netlify. No passwords needed in code - authentication happens through OAuth connections.