# Hugo Site Deployment Guide

This document provides comprehensive instructions for deploying your Hugo site using Git, GitHub Actions, and Netlify.

## Quick Start

1. **Set up the repository:**
   ```bash
   git add .
   git commit -m "Initial commit: Hugo site with deployment configuration"
   git branch -M main
   git remote add origin https://github.com/yourusername/your-repo-name.git
   git push -u origin main
   ```

2. **Configure Netlify:**
   - Connect your GitHub repository to Netlify
   - Set environment variables in Netlify dashboard
   - Deploy automatically on each push to main branch

## Environment Variables Setup

### Required Variables

Set these in your Netlify dashboard under Site Settings > Environment Variables:

| Variable | Description | Example |
|----------|-------------|---------|
| `NETLIFY_AUTH_TOKEN` | Your Netlify personal access token | `nfp_xxx...` |
| `NETLIFY_SITE_ID` | Your site's unique identifier | `abc123-def456...` |
| `HUGO_VERSION` | Hugo version to use | `0.129.0` |

### Optional Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_VERSION` | Node.js version | `18` |
| `GO_VERSION` | Go version | `1.21.0` |
| `GOOGLE_ANALYTICS_ID` | GA tracking ID | None |

## GitHub Secrets Setup

For GitHub Actions deployment, add these secrets in your GitHub repository:

1. Go to Settings > Secrets and Variables > Actions
2. Add the following Repository Secrets:

| Secret Name | Description |
|-------------|-------------|
| `NETLIFY_AUTH_TOKEN` | Your Netlify personal access token |
| `NETLIFY_SITE_ID` | Your Netlify site ID |

### Getting Netlify Credentials

1. **Auth Token:**
   - Go to [Netlify Personal Access Tokens](https://app.netlify.com/user/applications#personal-access-tokens)
   - Click "New access token"
   - Give it a descriptive name and copy the token

2. **Site ID:**
   - In your Netlify site dashboard
   - Go to Site Settings > General
   - Find "Site ID" in the site information section

## Deployment Workflows

### Automatic Deployment

- **Production:** Pushes to `main` branch trigger production deployment
- **Preview:** Pull requests generate preview deployments
- **Branch:** Feature branches can trigger branch deployments

### Manual Deployment

Use GitHub Actions workflow dispatch:
1. Go to Actions tab in your GitHub repository
2. Select "Deploy Hugo Site to Netlify"
3. Click "Run workflow"

## Branch Deploy Previews

This setup automatically creates deploy previews for:
- Pull requests
- Feature branches (if enabled)
- Development branches

Preview URLs are posted as PR comments automatically.

## Performance Monitoring

The deployment includes:
- Lighthouse CI for performance auditing
- HTML validation
- Basic link checking
- Content validation for markdown files

## Troubleshooting

### Common Issues

1. **Build Failures:**
   - Check Hugo version compatibility
   - Verify theme submodule is properly cloned
   - Check for missing dependencies

2. **Asset Loading Issues:**
   - Verify base URL configuration
   - Check static file paths
   - Ensure proper header configuration

3. **Environment Variables:**
   - Double-check variable names and values
   - Ensure secrets are properly set in GitHub
   - Verify Netlify environment configuration

### Build Logs

Check build logs in:
- Netlify dashboard > Deploys
- GitHub Actions > Workflow runs

### Debug Mode

Enable debug mode by setting:
```bash
HUGO_ENABLEGITINFO=true
HUGO_BUILDEXPERIMENTS=true
```

## Advanced Configuration

### Custom Build Commands

Modify `netlify.toml` build command for specific needs:
```toml
[build]
  command = "hugo --gc --minify --enableGitInfo"
```

### Content Management

The site includes CloudCannon configuration for CMS integration:
- Configuration: `cloudcannon.config.yml`
- Structures: `_structures/` directory
- Bookshop: `_cloudcannon/bookshop.yml`

### Performance Optimization

- Assets are automatically minified
- Images are optimized through Netlify
- Caching headers are configured for optimal performance
- CDN acceleration is enabled

## Security Features

- Content Security Policy headers
- XSS protection
- Frame options configured
- Secure referrer policy

## Monitoring and Analytics

Set up monitoring:
1. Add Google Analytics ID to environment variables
2. Configure Lighthouse CI for performance monitoring
3. Set up uptime monitoring (external service)

## Content Bulk Operations

For large-scale content management:
- Use Hugo's content management features
- Leverage CloudCannon's bulk editing
- Implement custom scripts for content generation

## Support

For issues:
1. Check the deployment logs
2. Review Hugo documentation
3. Check Netlify support documentation
4. Open an issue in your repository