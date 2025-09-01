# Hugo Website Maintenance Guide

A complete guide for beginners on how to maintain and update your Hugo website deployed across multiple platforms.

## Table of Contents
1. [Understanding Your Setup](#understanding-your-setup)
2. [Daily Maintenance Tasks](#daily-maintenance-tasks)
3. [Making Content Updates](#making-content-updates)
4. [Managing Your Three Deployment Platforms](#managing-your-three-deployment-platforms)
5. [Common Issues and Solutions](#common-issues-and-solutions)
6. [Monthly Maintenance Checklist](#monthly-maintenance-checklist)
7. [Getting Help](#getting-help)

## Understanding Your Setup

Your Hugo website is currently deployed on three different platforms, each serving as a backup for the others:

- **Netlify**: Primary site at https://hugowebapp.netlify.app/
- **GitHub Pages**: Secondary site at https://thonpa25.github.io/Hugo_app/
- **CloudCannon**: Third option at https://guided-wood.cloudvent.net/

All three sites update automatically when you push changes to your GitHub repository. This multi-platform approach ensures your website stays online even if one platform experiences issues.

## Daily Maintenance Tasks

### 1. Check Site Status
Visit each of your three sites regularly to make sure they're working properly:
- Load each site in your browser
- Click through the main navigation links
- Verify images are displaying correctly
- Check that forms (if any) are working

### 2. Monitor Build Status
Check your GitHub repository's Actions tab to see if recent builds were successful:
1. Go to https://github.com/thonpa25/Hugo_app/actions
2. Look for green checkmarks (successful builds) or red X marks (failed builds)
3. If you see failures, check the error messages and refer to the troubleshooting section

### 3. Review Analytics (if configured)
If you have Google Analytics or similar tools set up, check your daily visitor statistics and look for any unusual patterns.

## Making Content Updates

### Adding New Pages
1. Navigate to the `hugo-site/content` folder
2. Create a new `.md` file or copy an existing one as a template
3. Update the front matter (the content between the `---` lines at the top)
4. Write your content using Markdown format
5. Save the file
6. Commit and push your changes to GitHub

### Editing Existing Content
1. Find the `.md` file you want to edit in `hugo-site/content`
2. Make your changes using a text editor
3. Save the file
4. Commit and push your changes to GitHub

### Adding Images
1. Place new images in `hugo-site/static/images`
2. Reference them in your content using: `![Description](/images/filename.jpg)`
3. Commit and push your changes

### Basic Markdown Guide
- Headers: Use `#`, `##`, `###` for different heading levels
- Bold text: Wrap text in `**bold text**`
- Italic text: Wrap text in `*italic text*`
- Links: Use `[Link text](URL)`
- Lists: Start lines with `-` for bullets or `1.` for numbers

## Managing Your Three Deployment Platforms

### Netlify Management
1. Log into https://app.netlify.com
2. Find your site in the dashboard
3. To force a rebuild: Go to "Deploys" tab and click "Trigger deploy" > "Clear cache and deploy site"
4. To check build logs: Click on any deploy to see detailed logs
5. To update settings: Go to "Site settings" > "Build & deploy"

Important Netlify settings to maintain:
- Base directory: `hugo-site`
- Build command: `hugo --gc --minify --baseURL=https://hugowebapp.netlify.app/`
- Publish directory: `public`

### GitHub Pages Management
1. Go to your repository settings: https://github.com/thonpa25/Hugo_app/settings/pages
2. Ensure "Source" is set to "Deploy from a branch"
3. Make sure "gh-pages" branch is selected with "/ (root)" folder
4. Your site should show as "Your site is live at [URL]"

### CloudCannon Management
1. Log into your CloudCannon dashboard
2. Find your site and ensure it's set to "Public" visibility
3. Check that builds are completing successfully
4. Verify the custom domain is configured correctly

## Common Issues and Solutions

### Issue: Site Shows 404 Error
**Possible Causes:**
- Recent changes haven't been deployed yet
- Build failed due to syntax error
- Platform-specific configuration issue

**Solutions:**
1. Check GitHub Actions for failed builds
2. Wait 5-10 minutes for deployment to complete
3. Clear your browser cache and refresh
4. Check the specific platform's build logs

### Issue: Navigation Links Don't Work
**Possible Causes:**
- Wrong base URL configuration
- Missing pages
- Build configuration error

**Solutions:**
1. Verify all content files exist in `hugo-site/content`
2. Check that navigation is properly configured in `hugo-site/hugo.yaml`
3. Ensure each platform is using the correct base URL in build commands

### Issue: Images Not Loading
**Possible Causes:**
- Images not in correct folder
- Wrong file paths in content
- Build didn't include static files

**Solutions:**
1. Ensure images are in `hugo-site/static/images`
2. Check image paths in your content files
3. Verify image file names match exactly (case-sensitive)

### Issue: Unstyled Site (No CSS)
**Possible Causes:**
- Theme files missing
- Wrong base URL causing CSS to load from wrong domain
- Build cache issues

**Solutions:**
1. Check browser developer tools for CSS loading errors
2. Clear build cache and redeploy on the affected platform
3. Verify base URL is correct in build configuration

### Issue: Build Fails with Hugo Error
**Common Error Types:**
1. **Syntax Error in Markdown**: Check your `.md` files for proper formatting
2. **Missing Front Matter**: Ensure all content files have proper `---` delimited front matter
3. **Invalid Hugo Shortcodes**: Replace custom shortcodes with standard HTML

**Debugging Steps:**
1. Look at the exact error message in GitHub Actions
2. Find the file and line number mentioned in the error
3. Check that file for syntax issues
4. Test locally if possible

## Monthly Maintenance Checklist

### Security and Updates
- [ ] Check for Hugo version updates
- [ ] Review and update dependencies if needed
- [ ] Check all external links are still working
- [ ] Review site security headers
- [ ] Update contact information if changed

### Performance Review
- [ ] Test site loading speed on all three platforms
- [ ] Check mobile responsiveness
- [ ] Review and optimize large images
- [ ] Clean up unused files

### Content Review
- [ ] Review all pages for outdated information
- [ ] Check that all forms are working properly
- [ ] Update copyright dates if necessary
- [ ] Review and update meta descriptions

### Backup and Documentation
- [ ] Ensure your GitHub repository is your complete backup
- [ ] Document any configuration changes you've made
- [ ] Keep a list of important passwords and login details secure

## Getting Help

### When Something Goes Wrong
1. **Don't Panic**: You have three deployment platforms, so if one is down, the others likely still work
2. **Check Recent Changes**: Look at what you changed recently that might have caused the issue
3. **Read Error Messages**: GitHub Actions provides detailed error messages that often tell you exactly what's wrong
4. **Revert if Necessary**: You can always revert to a previous working version using Git

### Resources for Learning More
- **Hugo Documentation**: https://gohugo.io/documentation/
- **Markdown Guide**: https://www.markdownguide.org/
- **Git Basics**: https://git-scm.com/book/en/v2/Getting-Started-Git-Basics
- **GitHub Help**: https://docs.github.com/

### Emergency Contacts
Keep a note of:
- Your GitHub username and repository URL
- Login credentials for Netlify, CloudCannon (stored securely)
- Contact information for anyone who helped set up the site

## Final Tips for Success

1. **Make Small Changes**: Don't change everything at once. Make one small change, test it, then make the next change.

2. **Keep Backups**: Your GitHub repository IS your backup, but you can also download the entire repository as a ZIP file periodically.

3. **Test Before Publishing**: If possible, preview your changes before pushing them live.

4. **Keep Learning**: The more you understand about Hugo, Markdown, and web development, the easier maintenance becomes.

5. **Document Your Changes**: Keep notes about what you change and why. Future you will thank present you.

6. **Stay Consistent**: Try to make updates regularly rather than letting things pile up.

Remember: Your website is designed to be resilient with three deployment platforms. Even if you make a mistake, it's usually easy to fix, and you're unlikely to break everything at once. Don't be afraid to make updates and improvements to keep your site fresh and current.