# CloudCannon Deployment with Claude Code

## ✅ Setup Complete!

Your CloudCannon deployment automation is now fully configured to work with Claude Code.

---

## 🚀 How to Deploy to CloudCannon

### Method 1: Using NPM Commands (Recommended)

```bash
# Deploy to CloudCannon only
npm run deploy:cloudcannon

# Sync changes to GitHub (triggers CloudCannon)
npm run sync

# Deploy to both CloudCannon and Netlify
npm run deploy:all
```

### Method 2: Direct Script Execution

**Windows:**
```cmd
cd hugo-site
deploy-to-cloudcannon.bat
```

**Mac/Linux:**
```bash
cd hugo-site
./deploy-to-cloudcannon.sh
```

### Method 3: Using Node Directly
```bash
cd hugo-site
node scripts/deploy-cloudcannon.js
```

---

## 🔄 Automatic Deployment Flow

When you run any deployment command:

1. **Git Check** - Checks for uncommitted changes
2. **Auto Commit** - Commits any changes with timestamp
3. **Push to GitHub** - Pushes to main branch
4. **CloudCannon Syncs** - Automatically pulls from GitHub
5. **Build & Deploy** - CloudCannon builds and deploys

**Total time: 1-3 minutes**

---

## 📝 Common Claude Code Commands

### Quick Deploy
```bash
# Make changes and deploy immediately
npm run sync
```

### Full Workflow
```bash
# 1. Make your changes
# 2. Test locally
npm run dev

# 3. Deploy to CloudCannon
npm run deploy:cloudcannon

# 4. Check status
echo "Check https://app.cloudcannon.com for build status"
```

---

## ⚙️ Configuration

### Environment Variables (.env)
```env
# Optional - CloudCannon will sync even without this
CLOUDCANNON_BUILD_HOOK=https://app.cloudcannon.com/hooks/YOUR_HOOK_ID

# Already configured for Netlify
NETLIFY_BUILD_HOOK=https://api.netlify.com/build_hooks/6896c1f110673fda631dae2d
```

### CloudCannon Settings (Already Done)
- ✅ GitHub repo connected
- ✅ Auto-sync enabled
- ✅ Build on commit enabled
- ✅ Hugo configuration set

---

## 🎯 Quick Reference

| Command | Purpose | Time |
|---------|---------|------|
| `npm run sync` | Quick sync to CloudCannon | 1-2 min |
| `npm run deploy:cloudcannon` | Full CloudCannon deployment | 2-3 min |
| `npm run deploy:all` | Deploy everywhere | 3-4 min |
| `npm run dev` | Local development | Instant |

---

## 🔍 Monitoring Deployments

### Check Build Status
1. **CloudCannon Dashboard**: https://app.cloudcannon.com
   - Look for green checkmark
   - Click on site to see build logs

2. **GitHub Actions**: https://github.com/thonpa25/Hugo_app/actions
   - Shows workflow runs
   - Indicates sync status

3. **Netlify Dashboard**: https://app.netlify.com
   - Shows parallel deployment

---

## 🛠️ Troubleshooting

### "Updates were rejected" Error
```bash
# Pull latest changes first
git pull origin main
# Then deploy again
npm run deploy:cloudcannon
```

### CloudCannon Not Updating
1. Check CloudCannon dashboard for errors
2. Verify GitHub connection in CloudCannon settings
3. Ensure branch is set to `main` (not `master`)

### Build Failing
1. Check Hugo version matches (0.129.0)
2. Verify submodules are accessible
3. Check build logs in CloudCannon

---

## 🎨 Visual Editing Workflow

### For Non-Developers:
1. **Log in to CloudCannon**
2. **Click "Edit" on any page**
3. **Make changes in visual editor**
4. **Click "Save"**
   - CloudCannon auto-commits to GitHub
   - Site rebuilds automatically

### For Developers Using Claude Code:
1. **Make code changes locally**
2. **Run `npm run sync`**
3. **CloudCannon updates automatically**
4. **Visual editors see changes immediately**

---

## 📊 Deployment Architecture

```
Local (Claude Code)
    ↓ (npm run deploy:cloudcannon)
GitHub Repository
    ↓ (webhook/auto-sync)
    ├── CloudCannon (CMS & Hosting)
    └── Netlify (Public Hosting)
```

---

## ✨ Benefits of This Setup

- **One Command Deployment**: `npm run sync`
- **Automatic Everything**: No manual steps
- **Visual + Code**: Both workflows supported
- **Version Control**: All changes tracked
- **Dual Hosting**: Redundancy and flexibility
- **Fast Updates**: 1-3 minutes total

---

## 🚦 Status Indicators

### Success Signs:
- ✅ "Deployment Complete!" message
- ✅ Green checkmark in CloudCannon
- ✅ GitHub shows latest commit
- ✅ Site updated with changes

### Working Signs:
- 🔄 "Building..." in CloudCannon
- 🔄 Yellow dot in GitHub Actions
- 🔄 "Deploying..." in Netlify

---

## 📚 Additional Resources

- **CloudCannon Docs**: https://cloudcannon.com/documentation/
- **Hugo Docs**: https://gohugo.io/documentation/
- **GitHub Repo**: https://github.com/thonpa25/Hugo_app
- **Support**: Check `TROUBLESHOOTING.md` in docs folder

---

## 🎉 You're All Set!

Your CloudCannon deployment is fully automated with Claude Code. Just run:

```bash
npm run sync
```

And your changes will be live in minutes!