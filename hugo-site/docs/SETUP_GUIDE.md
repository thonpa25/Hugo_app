# Hugo Site Setup Guide

This guide will walk you through setting up Hugo and your site for local development. Follow these steps carefully - they're designed to work even if you're not technical.

## What You'll Accomplish

By the end of this guide, you'll be able to:
- Run your Hugo site locally on your computer
- Make changes and see them instantly
- Test changes before publishing them online
- Work offline on your content

## Prerequisites

- Windows, Mac, or Linux computer
- About 30 minutes of time
- Administrator access to install software

## Step 1: Install Hugo

### Windows Users

1. **Download Hugo**
   - Go to https://github.com/gohugoio/hugo/releases
   - Look for the latest release (should be at the top)
   - Download the file ending in `windows-amd64.zip`
   - Example: `hugo_0.120.4_windows-amd64.zip`

2. **Install Hugo**
   - Create a folder called `C:\Hugo`
   - Create a subfolder called `C:\Hugo\bin`
   - Extract the downloaded zip file
   - Copy `hugo.exe` to `C:\Hugo\bin`

3. **Add Hugo to System Path**
   - Press `Windows key + X` and select "System"
   - Click "Advanced system settings"
   - Click "Environment Variables"
   - Under "System Variables", find "Path" and click "Edit"
   - Click "New" and add: `C:\Hugo\bin`
   - Click "OK" to close all dialogs

4. **Test Installation**
   - Press `Windows key + R`, type `cmd`, press Enter
   - Type `hugo version` and press Enter
   - You should see something like: `hugo v0.120.4+extended`

**Screenshot Placeholder**: Windows Hugo installation steps

### Mac Users

1. **Install Homebrew** (if you don't have it)
   - Open Terminal (Applications → Utilities → Terminal)
   - Paste this command and press Enter:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Hugo**
   - In Terminal, run:
   ```bash
   brew install hugo
   ```

3. **Test Installation**
   - Run: `hugo version`
   - You should see the version number

**Screenshot Placeholder**: Mac Hugo installation with Homebrew

### Linux Users (Ubuntu/Debian)

1. **Install Hugo**
   ```bash
   sudo apt update
   sudo apt install hugo
   ```

2. **Test Installation**
   ```bash
   hugo version
   ```

**Screenshot Placeholder**: Linux Hugo installation

## Step 2: Install Git

Git helps you download and manage your website files.

### Windows
1. Download from https://git-scm.com/download/win
2. Run the installer with default settings
3. Test by opening Command Prompt and typing: `git --version`

### Mac
```bash
brew install git
```

### Linux
```bash
sudo apt install git
```

## Step 3: Download Your Site

1. **Get Your Repository URL**
   - Go to your GitHub repository (your developer should provide this)
   - Click the green "Code" button
   - Copy the HTTPS URL (looks like: `https://github.com/username/your-site.git`)

2. **Clone Your Site**
   - Open Terminal/Command Prompt
   - Navigate to where you want your site folder:
   ```bash
   cd Documents
   ```
   - Clone your site:
   ```bash
   git clone https://github.com/username/your-site.git
   cd your-site
   ```

**Screenshot Placeholder**: GitHub clone process

## Step 4: Install Dependencies

Your site might need additional tools. In your site folder:

```bash
# Install Node.js dependencies (if package.json exists)
npm install

# Install Python dependencies (if requirements.txt exists)  
pip install -r scripts/requirements.txt
```

**Note**: You may need to install Node.js from https://nodejs.org first.

## Step 5: Run Your Site Locally

1. **Start Hugo Server**
   ```bash
   hugo server
   ```

2. **View Your Site**
   - Open your web browser
   - Go to: http://localhost:1313
   - You should see your website!

**Screenshot Placeholder**: Hugo server running and localhost view

## Step 6: Making Changes

Now you can edit your site and see changes instantly:

1. **Edit a File**
   - Open any `.md` file in `content/` folder
   - Make a small change to the text
   - Save the file

2. **See Changes**
   - Go back to your browser (http://localhost:1313)
   - The page should update automatically!
   - If not, refresh the page

**Screenshot Placeholder**: Live reload demonstration

## Common Commands

Keep these handy for daily use:

```bash
# Start development server (most common)
hugo server

# Start server and include draft posts
hugo server -D

# Build site for production
hugo

# Check for issues
hugo check

# Get help
hugo help
```

## Folder Structure Explained

```
your-site/
├── content/           # Your pages and blog posts (.md files)
│   ├── _index.md     # Homepage content  
│   ├── blog/         # Blog posts
│   └── contact.md    # Other pages
├── assets/           # Images, CSS, JavaScript
├── data/             # Site configuration data
├── layouts/          # HTML templates (usually don't touch)
├── static/           # Files copied directly to site
├── themes/           # Site theme (don't modify)
├── hugo.toml        # Main site settings
└── public/          # Generated site (auto-created)
```

## Development Workflow

Here's your daily workflow:

1. **Start Your Day**
   ```bash
   cd your-site
   hugo server
   ```

2. **Make Changes**
   - Edit `.md` files in `content/` folder
   - Add images to `assets/images/`
   - View changes at http://localhost:1313

3. **When Happy with Changes**
   ```bash
   git add .
   git commit -m "Updated homepage content"
   git push
   ```

4. **End Your Day**
   - Press `Ctrl+C` in the terminal to stop Hugo server

## File Types You'll Work With

| File Type | What It Is | Where Found |
|-----------|------------|-------------|
| `.md` | Markdown files (your content) | `content/` folder |
| `.yml` or `.yaml` | Configuration files | `data/` folder |
| `.toml` | Main configuration | `hugo.toml` |
| `.html` | Templates (advanced) | `layouts/` folder |
| Images | `.jpg`, `.png`, `.svg` | `assets/images/` |

## Troubleshooting Setup

### Hugo Command Not Found
- **Windows**: Check that `C:\Hugo\bin` is in your PATH
- **Mac/Linux**: Reinstall using package manager

### Port Already in Use
- Someone else is using port 1313
- Use a different port: `hugo server -p 1314`

### Site Doesn't Load
1. Check terminal for error messages
2. Make sure you're in the right folder (`cd your-site`)
3. Try: `hugo server --disableFastRender`

### Permission Denied Errors
- **Windows**: Run Command Prompt as Administrator
- **Mac/Linux**: Check folder permissions: `chmod -R 755 your-site/`

### Build Errors
1. Run: `hugo check` to find issues
2. Check for syntax errors in `.md` files
3. Look for missing images or broken links

## Next Steps

Once you have local development working:

1. **Learn the basics**: [CloudCannon Editing Guide](CLOUDCANNON_EDITING.md)
2. **For bulk content**: [GitHub Desktop Workflow](GITHUB_DESKTOP_WORKFLOW.md)
3. **For directory sites**: [Bulk Operations Guide](BULK_OPERATIONS.md)

## Pro Tips

- **Keep Hugo server running** while you work - it updates automatically
- **Use a good text editor** like VS Code, Atom, or Sublime Text
- **Learn basic Markdown** - it's easier than HTML
- **Test locally first** before pushing changes
- **Backup regularly** by pushing to GitHub

## VS Code Setup (Recommended)

If you want a great editing experience:

1. **Install VS Code**: https://code.visualstudio.com/
2. **Install Extensions**:
   - "Hugo Language and Syntax Support"
   - "Markdown All in One"
   - "GitLens"
3. **Open Your Site**: File → Open Folder → Select your site folder

**Screenshot Placeholder**: VS Code with Hugo extensions

---

**Congratulations!** � You now have a complete local development setup. You can edit your site offline, see changes instantly, and deploy when ready.

**Need help?** Check the [Troubleshooting Guide](TROUBLESHOOTING.md) or reach out with specific error messages.