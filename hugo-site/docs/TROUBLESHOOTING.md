# Troubleshooting Guide: Common Issues and Solutions

This guide covers the most common issues you might encounter and provides step-by-step solutions. Follow the troubleshooting steps in order - they're designed to fix issues quickly.

## Emergency Quick Fixes

If your site is broken and you need it fixed immediately:

### Site Won't Load at All

1. **Check Hosting Status**
   - Go to your hosting provider's status page
   - Check CloudCannon, Netlify, or Vercel status
   - Wait 10-15 minutes if there's an outage

2. **Revert Last Changes**
   - Log into CloudCannon → Pages → History
   - Click "Revert" on the last change
   - Or use GitHub Desktop to undo commits

3. **Emergency Rollback**
   ```bash
   # If you have local access
   git log --oneline
   git revert HEAD    # Undo last commit
   git push
   ```

### Site Partially Working

1. **Clear Browser Cache**
   - Press `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)
   - Or try incognito/private browsing mode

2. **Wait for Deployment**
   - Changes can take 2-5 minutes to appear
   - Check deployment status in your hosting dashboard

## Content and Editing Issues

### CloudCannon Editor Problems

#### Editor Won't Load
**Symptoms**: White screen, loading forever, error messages

**Solutions**:
1. **Check Internet Connection**
   - Try loading other websites
   - Switch to different network if possible

2. **Browser Issues**
   ```
   Clear browser cache and cookies:
   - Chrome: Settings → Privacy → Clear browsing data
   - Firefox: Settings → Privacy → Clear Data
   - Safari: Safari → Clear History
   ```

3. **Try Different Browser**
   - Test in Chrome, Firefox, Safari, Edge
   - Use incognito/private mode

4. **Disable Browser Extensions**
   - Temporarily disable ad blockers
   - Disable VPN extensions
   - Try with all extensions disabled

**Screenshot Placeholder**: Browser cache clearing steps

#### Can't Edit Specific Pages
**Symptoms**: Some pages editable, others not

**Solutions**:
1. **Check Page Permissions**
   - Verify your user role has edit access
   - Contact admin if you need higher permissions

2. **Page Lock Issues**
   - Another user might be editing
   - Try again in 10-15 minutes
   - Contact other team members

3. **Template Issues**
   - Some pages might not support visual editing
   - Try "Source" editor mode instead
   - Contact developer for page template fixes

### Content Not Updating

#### Changes Don't Appear on Live Site
**Symptoms**: You made changes but don't see them on the website

**Solutions**:
1. **Check Publishing Status**
   - Did you click "Publish" in CloudCannon?
   - Check if page is set to "Draft" status
   - Look for "Unpublished Changes" indicator

2. **Wait for Deployment**
   ```
   Typical deployment times:
   - CloudCannon: 2-5 minutes
   - Netlify: 3-8 minutes
   - Vercel: 1-3 minutes
   ```

3. **Force Browser Refresh**
   - Press `Ctrl+F5` (Windows) or `Cmd+Shift+R` (Mac)
   - Clear browser cache completely
   - Try different device/browser

4. **Check Deployment Status**
   - CloudCannon: Site → Activity tab
   - Netlify: Deploys section in dashboard
   - GitHub: Actions tab (if using GitHub Actions)

#### Images Not Showing
**Symptoms**: Broken image icons, missing photos

**Solutions**:
1. **Check Image Upload**
   - Verify images uploaded successfully
   - Check file size (should be under 10MB)
   - Ensure file format is supported (JPG, PNG, GIF, SVG)

2. **Fix Image Paths**
   ```markdown
   # Correct path format
   ![Description](images/my-image.jpg)
   
   # Not this
   ![Description](../assets/images/my-image.jpg)
   ```

3. **Check Image Names**
   - No spaces in filenames
   - Use lowercase letters
   - Avoid special characters except hyphens

4. **Re-upload Images**
   - Delete and re-upload problematic images
   - Use different filename
   - Check image isn't corrupted

### Form and Functionality Issues

#### Contact Forms Not Working
**Symptoms**: Forms submit but no emails received

**Solutions**:
1. **Check Email Settings**
   - Verify destination email in form settings
   - Check spam/junk folder
   - Try different email address

2. **Form Configuration**
   ```yaml
   # Check these settings in CloudCannon
   destination: "your-email@domain.com"  # Correct email
   netlify_forms: true                   # If using Netlify
   honeypot: true                        # Spam protection enabled
   ```

3. **Test Form Fields**
   - Try submitting with minimal information
   - Check all required fields are filled
   - Disable spam protection temporarily

4. **Hosting Provider Issues**
   - Check Netlify Forms dashboard
   - Verify form handling is enabled
   - Contact hosting support if needed

#### Search Not Working
**Symptoms**: Search returns no results or errors

**Solutions**:
1. **Rebuild Search Index**
   ```bash
   # If using local development
   hugo server --disableFastRender
   ```

2. **Check Search Configuration**
   - Verify search is enabled in site settings
   - Check search index files are generated
   - Clear browser cache

3. **Content Issues**
   - Ensure content has proper front matter
   - Check for special characters in content
   - Verify page types are searchable

## Technical Issues

### Hugo Development Problems

#### Hugo Server Won't Start
**Symptoms**: Error messages when running `hugo server`

**Solutions**:
1. **Check Hugo Installation**
   ```bash
   hugo version
   # Should show version number
   ```

2. **Update Hugo**
   ```bash
   # Mac with Homebrew
   brew upgrade hugo
   
   # Windows - download latest from GitHub
   # Linux
   sudo apt update && sudo apt install hugo
   ```

3. **Check Site Configuration**
   ```bash
   # Validate config file
   hugo config
   
   # Check for syntax errors
   hugo check
   ```

4. **Common Fixes**
   ```bash
   # Try different port
   hugo server -p 1314
   
   # Disable fast render
   hugo server --disableFastRender
   
   # Clean and rebuild
   hugo --gc
   ```

#### Build Errors
**Symptoms**: Hugo shows error messages during build

**Common Errors and Solutions**:

1. **YAML Front Matter Errors**
   ```
   Error: Error parsing... invalid character
   ```
   **Fix**: Check YAML formatting in `.md` files
   ```yaml
   ---
   title: "My Title"  # Quotes around titles with special characters
   date: 2023-12-01   # Proper date format
   ---
   ```

2. **Missing Files**
   ```
   Error: file not found: images/missing.jpg
   ```
   **Fix**: 
   - Check file exists in `assets/images/`
   - Verify correct file path and spelling
   - Re-upload missing images

3. **Template Errors**
   ```
   Error: template: ... function "nonexistent" not defined
   ```
   **Fix**: Contact developer - theme issue

### Performance Issues

#### Site Loading Slowly
**Symptoms**: Pages take 5+ seconds to load

**Solutions**:
1. **Image Optimization**
   - Compress large images (use TinyPNG.com)
   - Convert to WebP format if supported
   - Remove unused images

2. **Content Optimization**
   - Reduce page content size
   - Minimize number of posts on homepage
   - Implement pagination for long lists

3. **Hosting Issues**
   - Check hosting provider status
   - Consider upgrading hosting plan
   - Enable CDN if available

4. **Code Optimization**
   ```bash
   # Build optimized version
   hugo --minify --gc
   ```

#### Out of Memory Errors
**Symptoms**: Build process crashes, memory errors

**Solutions**:
1. **Reduce Batch Size** (for bulk operations)
   ```bash
   python scripts/csv_to_markdown.py file.csv output/ --batch-size 100
   ```

2. **Clean Up Site**
   ```bash
   # Remove unnecessary files
   hugo --gc
   
   # Clean public directory
   rm -rf public/
   ```

3. **System Resources**
   - Close other applications
   - Restart computer
   - Check available disk space

### Deployment Issues

#### Builds Failing on Hosting Platform
**Symptoms**: Local site works, but hosting shows build errors

**Solutions**:
1. **Hugo Version Mismatch**
   ```yaml
   # Set Hugo version in netlify.toml
   [build.environment]
   HUGO_VERSION = "0.120.4"
   
   # Or in package.json
   "engines": {
     "hugo": "0.120.4"
   }
   ```

2. **Environment Variables**
   - Check all required environment variables are set
   - Verify API keys and secrets are configured
   - Test with same Hugo version locally

3. **Dependency Issues**
   ```bash
   # Reinstall dependencies
   npm install
   pip install -r requirements.txt
   ```

#### Domain/SSL Issues
**Symptoms**: Site loads but shows security warnings

**Solutions**:
1. **DNS Configuration**
   - Verify DNS settings with domain registrar
   - Wait 24-48 hours for DNS propagation
   - Use DNS checker tools online

2. **SSL Certificate**
   - Enable automatic SSL in hosting dashboard
   - Force HTTPS redirect
   - Check certificate status

3. **Mixed Content Errors**
   - Update all HTTP links to HTTPS
   - Check image sources use HTTPS
   - Update external resource links

## Data and Content Issues

### File Management Problems

#### Files Disappeared
**Symptoms**: Content or images missing from site

**Solutions**:
1. **Check Version History**
   - CloudCannon: Browse → History
   - GitHub: Check commit history
   - Look for accidental deletions

2. **Restore from Backup**
   ```bash
   # Git restore
   git checkout HEAD~1 -- path/to/file.md
   
   # Or revert entire commit
   git revert COMMIT_HASH
   ```

3. **Recovery Methods**
   - Check CloudCannon's file browser
   - Look in trash/recycle bin
   - Contact hosting provider support

#### Corrupt Files
**Symptoms**: Files won't open, strange characters, build errors

**Solutions**:
1. **Re-upload Files**
   - Delete corrupted files
   - Re-upload from original source
   - Check file encoding (should be UTF-8)

2. **Fix Encoding Issues**
   ```bash
   # Convert file encoding
   iconv -f ISO-8859-1 -t UTF-8 file.md > file_fixed.md
   ```

3. **Validate Content**
   ```bash
   # Check for invalid characters
   hugo check
   
   # Validate YAML front matter
   python -c "import yaml; yaml.safe_load(open('file.md').read().split('---')[1])"
   ```

### Database/Search Issues

#### Search Index Corrupted
**Symptoms**: Search returns wrong results or errors

**Solutions**:
1. **Rebuild Search Index**
   ```bash
   # Force rebuild
   hugo --gc
   hugo server --disableFastRender
   ```

2. **Clear Browser Storage**
   ```javascript
   // In browser console
   localStorage.clear();
   sessionStorage.clear();
   ```

3. **Reset Search Configuration**
   - Check search settings in site config
   - Verify search JavaScript files are loading
   - Test search on fresh browser/device

#### Bulk Operation Failures
**Symptoms**: CSV imports fail, batch operations error

**Solutions**:
1. **Data Validation**
   ```bash
   # Check CSV format
   python scripts/bulk_operations.py validate import/file.csv
   
   # Fix common issues
   python scripts/bulk_operations.py fix-csv import/file.csv
   ```

2. **Memory Issues**
   ```bash
   # Reduce batch size
   python scripts/csv_to_markdown.py file.csv output/ --batch-size 50
   
   # Use streaming mode
   python scripts/csv_to_markdown.py file.csv output/ --stream
   ```

3. **Permission Issues**
   ```bash
   # Fix file permissions
   chmod -R 755 content/
   
   # Check disk space
   df -h
   ```

## Security Issues

### Access Problems

#### Can't Login to CloudCannon
**Symptoms**: Wrong password errors, account locked

**Solutions**:
1. **Password Reset**
   - Use "Forgot Password" link
   - Check email (including spam folder)
   - Try different email addresses

2. **Account Issues**
   - Contact site administrator
   - Verify you have correct login URL
   - Check if account was deactivated

3. **Browser Issues**
   - Clear cookies for CloudCannon site
   - Try incognito/private mode
   - Test different browser

#### Permission Denied Errors
**Symptoms**: Can't edit certain sections, access denied

**Solutions**:
1. **Check User Role**
   - Admin: Full access
   - Editor: Content only
   - Viewer: Read only

2. **Contact Administrator**
   - Request permission upgrade
   - Verify team membership
   - Check site access settings

### Security Warnings

#### Mixed Content Warnings
**Symptoms**: Browser shows "not secure" warnings

**Solutions**:
1. **Update Links to HTTPS**
   ```markdown
   # Change this
   ![Image](http://example.com/image.jpg)
   
   # To this  
   ![Image](https://example.com/image.jpg)
   ```

2. **Check External Resources**
   - Update all HTTP links to HTTPS
   - Verify third-party services support SSL
   - Remove insecure content if necessary

3. **Force HTTPS Redirect**
   ```toml
   # In hugo.toml
   baseURL = 'https://yourdomain.com/'
   
   # Force HTTPS in hosting settings
   ```

## Getting Additional Help

### Self-Help Resources

1. **Built-in Documentation**
   - CloudCannon: Help section in interface
   - Hugo: https://gohugo.io/documentation/
   - Theme documentation in `themes/bigspring/`

2. **Log Files**
   ```bash
   # Check Hugo errors
   hugo server --debug
   
   # Check batch operation logs
   cat scripts/batch_processor.log
   
   # System logs (Linux/Mac)
   tail -f /var/log/system.log
   ```

3. **Validation Tools**
   ```bash
   # Validate site content
   hugo check
   
   # Check links
   hugo server & 
   wget --spider -r -nd -nv -H -l 1 -w 2 -o wget.log http://localhost:1313/
   ```

### When to Contact Support

**Contact CloudCannon Support for:**
- Login/account issues
- Billing problems
- Site won't build
- Missing features

**Contact Developer/Agency for:**
- Custom feature requests
- Theme modifications
- Complex technical issues
- Site structure changes

**Contact Hosting Support for:**
- Domain issues
- SSL certificate problems
- Performance issues
- Service outages

### Preparing Support Requests

**Include This Information:**
1. **Clear Problem Description**
   - What you were trying to do
   - What happened instead
   - Error messages (exact text)

2. **Technical Details**
   - Browser and version
   - Operating system
   - Site URL
   - When problem started

3. **Steps to Reproduce**
   - List exact steps taken
   - Include screenshots if helpful
   - Mention if problem is consistent

4. **Recent Changes**
   - What changed recently
   - Who made changes
   - When changes were made

## Prevention Tips

### Regular Maintenance

**Weekly Checks:**
- [ ] Test all forms and functionality
- [ ] Check for broken links
- [ ] Monitor site performance
- [ ] Review recent content changes

**Monthly Tasks:**
- [ ] Update passwords
- [ ] Review user access
- [ ] Check backup systems
- [ ] Monitor search analytics

**Quarterly Reviews:**
- [ ] Update Hugo version
- [ ] Review theme updates
- [ ] Check security settings
- [ ] Performance optimization

### Best Practices

1. **Content Management**
   - Always preview before publishing
   - Test changes on multiple devices
   - Keep content organized in folders
   - Use descriptive filenames

2. **Technical Practices**
   - Keep regular backups
   - Test locally before deploying
   - Use version control effectively
   - Monitor site performance

3. **Security Practices**
   - Use strong passwords
   - Enable two-factor authentication
   - Review user permissions regularly
   - Keep software updated

---

**Remember**: Most issues have simple solutions. Start with the basic fixes (clear cache, wait for deployment, restart browser) before moving to advanced troubleshooting.

**Still Stuck?** Document the exact steps you took and the error messages you received, then contact the appropriate support team with this information.