# GitHub Desktop Workflow for Bulk Content Editing

This guide shows you how to use GitHub Desktop for managing your Hugo site content, especially when you need to edit many files at once or work with a team.

## What You'll Accomplish

By the end of this guide, you'll be able to:
- Edit your site content without using CloudCannon  
- Make bulk changes to dozens of files at once
- Work offline and sync when ready
- Collaborate with team members safely
- Keep a complete history of all changes

## Why Use GitHub Desktop?

**Perfect for:**
- Editing 10+ blog posts at once
- Making consistent changes across many files
- Working with content teams
- Bulk find-and-replace operations
- Working offline or with poor internet
- Learning version control basics

**Not needed for:**
- Single page edits (use CloudCannon instead)
- Adding one blog post (CloudCannon is faster)
- Simple text changes (CloudCannon is easier)

## Step 1: Install GitHub Desktop

### Download and Install

1. **Go to**: https://desktop.github.com/
2. **Download** the app for your operating system
3. **Install** with default settings
4. **Sign in** with your GitHub account

**Screenshot Placeholder**: GitHub Desktop download page

### First-Time Setup

1. **Configure Git**
   - Enter your name and email
   - This will appear in your commit history

2. **Verify Connection**
   - You should see your repositories listed
   - If not, check your GitHub account permissions

**Screenshot Placeholder**: GitHub Desktop initial setup screen

## Step 2: Clone Your Repository

### Method 1: Through GitHub Desktop

1. **Clone Repository**
   - Click "Clone a repository from the Internet"
   - Choose your Hugo site repository
   - Select local folder location (e.g., `Documents/Websites/`)
   - Click "Clone"

**Screenshot Placeholder**: Cloning repository through GitHub Desktop

### Method 2: Add Existing Local Repository

If you already have the site locally:

1. **Add Repository**
   - Click "Add an existing repository from your hard drive"
   - Browse to your site folder
   - Click "Add Repository"

## Step 3: Understanding the Interface

### Main Areas

**Left Sidebar:**
- **Changes**: Files you've modified
- **History**: Previous commits and changes

**Center Panel:**
- **File list**: Shows all changed files
- **Diff view**: Shows exactly what changed in each file

**Bottom Panel:**
- **Commit message**: Where you describe your changes
- **Commit button**: Saves your changes

**Screenshot Placeholder**: GitHub Desktop interface overview

### File Status Icons

| Icon | Meaning |
|------|---------|
| M | Modified (file was changed) |
| A | Added (new file) |
| D | Deleted (file was removed) |
| R | Renamed (file name changed) |

## Step 4: Basic Workflow

### Daily Workflow Process

1. **Start Your Day - Sync Latest Changes**
   ```
   Click "Fetch origin" button (top right)
   If changes exist, click "Pull origin"
   ```

2. **Make Your Changes**
   - Edit files in your preferred text editor
   - Add new files to the `content/` folder
   - Delete files you no longer need

3. **Review Changes**
   - Open GitHub Desktop
   - Review the "Changes" tab
   - Click on each file to see what changed

4. **Commit Changes**
   - Write a descriptive commit message
   - Click "Commit to main"

5. **Publish Changes**
   - Click "Push origin"
   - Your site will update automatically

**Screenshot Placeholder**: Complete workflow sequence

### Writing Good Commit Messages

**Good Examples:**
- "Add 5 new blog posts about digital marketing"
- "Update contact information across all pages"  
- "Fix typos in homepage and about page"
- "Bulk update: Change company name throughout site"

**Bad Examples:**
- "Changes"
- "Update"
- "Stuff"

## Step 5: Bulk Editing Techniques

### Bulk Text Replacement

**Scenario**: Change your company name from "Old Company" to "New Company" across your entire site.

1. **Use a Text Editor with Find/Replace**
   - **VS Code**: `Ctrl+Shift+H` (Windows) or `Cmd+Shift+H` (Mac)
   - **Sublime Text**: `Ctrl+Shift+F` (Windows) or `Cmd+Shift+F` (Mac)
   - **Atom**: `Ctrl+Shift+F` (Windows) or `Cmd+Shift+F` (Mac)

2. **Set Search Scope**
   - Search in: Your entire site folder
   - Include: `.md`, `.yml`, `.toml` files
   - Exclude: `themes/`, `public/` folders

3. **Replace All**
   - Find: "Old Company"
   - Replace: "New Company"
   - Review each replacement before confirming

4. **Test Changes**
   - Run `hugo server` locally
   - Check that everything still works
   - Look for any unexpected replacements

**Screenshot Placeholder**: VS Code find and replace across project

### Bulk Image Updates

**Scenario**: Update images across multiple blog posts.

1. **Organize New Images**
   - Place new images in `assets/images/blog/`
   - Use consistent naming convention

2. **Update Markdown Files**
   - Open multiple `.md` files
   - Update image references:
   ```markdown
   ![Description](images/blog/new-image.jpg)
   ```

3. **Remove Old Images**
   - Delete unused images from `assets/images/`
   - This keeps your site lightweight

### Bulk Metadata Updates

**Scenario**: Add new tags to all blog posts in a category.

1. **Filter Files**
   - Use your text editor to open all files in `content/blog/`
   - Filter by category or date

2. **Update Front Matter**
   - Add new tags to the YAML front matter:
   ```yaml
   ---
   title: "Blog Post Title"
   date: 2023-12-01
   tags: ["existing-tag", "new-tag", "another-new-tag"]
   category: "digital-marketing"
   ---
   ```

3. **Validate YAML**
   - Check that your YAML is properly formatted
   - Use a YAML validator if unsure

## Step 6: Team Collaboration

### Setting Up Team Access

1. **Repository Permissions**
   - Go to GitHub.com → Your Repository → Settings → Manage Access
   - Click "Invite a collaborator"
   - Enter team member's GitHub username
   - Choose permission level (Write for editors)

2. **Team Member Setup**
   - Team member installs GitHub Desktop
   - Team member clones the repository
   - Test that they can make and push changes

**Screenshot Placeholder**: GitHub repository collaboration settings

### Collaboration Workflow

**Daily Team Routine:**

1. **Morning Sync**
   - Everyone clicks "Fetch origin" first thing
   - Pull any new changes before starting work

2. **Work Assignment**
   - Assign different folders/files to different people
   - Avoid editing the same files simultaneously

3. **Regular Pushes**
   - Commit and push changes frequently (every hour or so)
   - Don't wait until end of day

4. **Conflict Resolution**
   - If conflicts arise, GitHub Desktop will guide you
   - When in doubt, ask the person who made the other change

### Handling Merge Conflicts

**What's a Merge Conflict?**
When two people edit the same part of the same file.

**How to Resolve:**

1. **GitHub Desktop will show conflicts**
   - Files with conflicts will be marked
   - Click on the file to see conflict markers

2. **Edit the File**
   - Look for conflict markers:
   ```markdown
   <<<<<<< HEAD
   Your changes
   =======
   Their changes
   >>>>>>> branch-name
   ```

3. **Choose the Right Content**
   - Keep what you want
   - Delete the conflict markers
   - Save the file

4. **Mark as Resolved**
   - GitHub Desktop will detect the resolution
   - Commit the merge

**Screenshot Placeholder**: Merge conflict resolution in GitHub Desktop

## Step 7: Advanced Bulk Operations

### Using Scripts for Complex Changes

**Scenario**: Update dates on 50+ blog posts.

1. **Create a Simple Script** (`update-dates.py`):
   ```python
   import os
   import re
   from datetime import datetime, timedelta
   
   # Update all blog post dates to be more recent
   content_dir = "content/blog/"
   
   for filename in os.listdir(content_dir):
       if filename.endswith(".md"):
           filepath = os.path.join(content_dir, filename)
           
           with open(filepath, 'r') as file:
               content = file.read()
           
           # Update date in front matter
           new_content = re.sub(
               r'date: \d{4}-\d{2}-\d{2}',
               f'date: {datetime.now().strftime("%Y-%m-%d")}',
               content
           )
           
           with open(filepath, 'w') as file:
               file.write(new_content)
   
   print("All blog post dates updated!")
   ```

2. **Run the Script**
   ```bash
   python update-dates.py
   ```

3. **Review Changes in GitHub Desktop**
   - Check that the script worked correctly
   - Commit the changes

### Bulk Content Import

**Scenario**: Import content from Google Sheets or CSV.

1. **Export Data**
   - Download as CSV from Google Sheets
   - Or export from your CMS

2. **Use Hugo's Built-in Tools**
   - Use the scripts in your `scripts/` folder
   - See [Bulk Operations Guide](BULK_OPERATIONS.md) for details

3. **Review in GitHub Desktop**
   - Check all new files were created properly
   - Verify content formatting
   - Commit when satisfied

## Step 8: Quality Control Process

### Pre-Commit Checklist

Before committing bulk changes:

- [ ] **Test Locally**
  ```bash
  hugo server
  # Check site loads without errors
  ```

- [ ] **Spell Check**
  - Use your text editor's spell check
  - Review common words that might be wrong

- [ ] **Link Check**
  - Verify internal links still work
  - Check that image paths are correct

- [ ] **Formatting Check**
  - Ensure Markdown formatting is correct
  - Verify YAML front matter is valid

### Post-Commit Verification

After pushing changes:

1. **Check Live Site**
   - Wait a few minutes for deployment
   - Check that changes appear correctly

2. **Test Key Functionality**
   - Try contact forms
   - Check navigation menus
   - Test search functionality (if applicable)

3. **Mobile Check**
   - View site on mobile device
   - Check for layout issues

## Step 9: Backup and Recovery

### Creating Backups

**Before Major Changes:**

1. **Create a Branch**
   - In GitHub Desktop: Branch → New Branch
   - Name it: `backup-before-bulk-update-YYYY-MM-DD`
   - Make your changes on main branch
   - Keep backup branch as safety net

2. **Download Full Backup**
   - Go to GitHub.com → Your Repository
   - Click "Code" → "Download ZIP"
   - Store locally with date stamp

### Recovery Process

**If Something Goes Wrong:**

1. **Revert Recent Commits**
   - In GitHub Desktop, go to History tab
   - Right-click problematic commit
   - Choose "Revert changes"

2. **Restore from Backup Branch**
   - Switch to backup branch
   - Create new branch from backup
   - Cherry-pick good changes

3. **Emergency Recovery**
   - Delete local repository folder
   - Re-clone from GitHub
   - You'll lose uncommitted changes but keep everything else

## Troubleshooting Common Issues

### GitHub Desktop Won't Start

**Solutions:**
1. Restart your computer
2. Check for updates to GitHub Desktop
3. Reinstall GitHub Desktop
4. Check antivirus software isn't blocking it

### Can't Push Changes

**Common Causes:**
- No internet connection
- Repository permissions changed
- Large file sizes
- Git LFS issues

**Solutions:**
1. Check internet connection
2. Verify repository access on GitHub.com
3. Remove large files (>100MB)
4. Contact repository administrator

### Files Not Showing Changes

**Common Causes:**
- Files saved outside of repository folder
- Hidden files not visible
- .gitignore excluding files

**Solutions:**
1. Verify you're editing files in correct folder
2. Check .gitignore file
3. Refresh GitHub Desktop (View → Refresh)

### Merge Conflicts Seem Broken

**Solution:**
1. Use external text editor to resolve conflicts
2. Look for the conflict markers (<<<<< ===== >>>>>)
3. Edit file to remove markers and keep desired content
4. Save file and return to GitHub Desktop

## Best Practices Summary

### Do's
- Commit changes frequently (every 30-60 minutes)
- Write descriptive commit messages
- Test changes locally before pushing
- Pull latest changes before starting work
- Back up before major bulk operations
- Communicate with team about large changes

### Don'ts
- ❌ Work for hours without committing
- ❌ Push changes without testing
- ❌ Ignore merge conflicts
- ❌ Edit files outside the repository folder
- ❌ Commit temporary or test files
- ❌ Force push without understanding why

## Integration with Other Tools

### VS Code Integration

1. **Install Git Extension**
   - VS Code has built-in Git support
   - Shows changes in sidebar
   - Can commit directly from editor

2. **Use Both Tools**
   - Edit in VS Code
   - Review and commit in GitHub Desktop
   - Best of both worlds

### CloudCannon Integration

**Workflow:**
1. Use CloudCannon for single-page edits
2. Use GitHub Desktop for bulk operations
3. Changes sync automatically between both
4. Team members can use their preferred method

---

**Success!** � You now have a complete GitHub Desktop workflow for managing your Hugo site content efficiently.

**Next Steps:**
- Practice with small changes first
- Set up your team collaboration workflow
- Learn more advanced Git features as needed
- Check out [Bulk Operations Guide](BULK_OPERATIONS.md) for CSV imports and advanced bulk operations