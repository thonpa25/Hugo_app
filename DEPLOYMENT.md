# Hugo Site Deployment Configuration

## Platform URLs
- **Netlify**: https://hugowebapp.netlify.app/
- **CloudCannon**: https://guided-wood.cloudvent.net/
- **GitHub Pages**: https://thonpa25.github.io/Hugo_app/

## Required Manual Configuration

### GitHub Pages
1. Go to Settings → Pages
2. Set Source to "Deploy from a branch"
3. Select "gh-pages" branch and "/ (root)" folder
4. Save changes

### Netlify
1. Log into Netlify dashboard
2. Go to Site Settings → Build & Deploy
3. Clear cache and redeploy
4. Ensure build command is: `hugo --gc --minify --baseURL=https://hugowebapp.netlify.app/`

### CloudCannon
1. Log into CloudCannon dashboard
2. Go to Site Settings → Hosting
3. Set site visibility to "Public"
4. Ensure custom domain is configured correctly

## Build Commands by Platform
- **Netlify**: `hugo --gc --minify --baseURL=https://hugowebapp.netlify.app/`
- **CloudCannon**: `hugo --gc --minify --baseURL=https://guided-wood.cloudvent.net/`
- **GitHub Pages**: `hugo --gc --minify --baseURL=https://thonpa25.github.io/Hugo_app/`

## Troubleshooting
- If navigation shows wrong URLs, check baseURL in build command
- If site shows 404, verify branch deployment settings
- If site requires login, check visibility/privacy settings