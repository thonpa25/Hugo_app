# Hugo Site Shell - Complete Guide

A simple, fast, and professional Hugo website template that anyone can edit - no coding required! Perfect for agencies and freelancers building client sites.

## Table of Contents
- [Quick Start (5 minutes)](#quick-start-5-minutes)
- [Installation Guide](#installation-guide)
- [Daily Usage](#daily-usage)
- [Features](#features)
- [Common Tasks](#common-tasks)
- [Troubleshooting](#troubleshooting)
- [Advanced Options](#advanced-options)

---

## Quick Start (5 Minutes)

### Prerequisites
- **GitHub account** (free at github.com)  
- **Netlify account** (free at netlify.com)  
- **GitHub Desktop** installed ([download here](https://desktop.github.com/))  
- **Text editor** (Notepad works fine, or [VS Code](https://code.visualstudio.com/) for more features)

### Step 1: Get Your Copy
1. Go to this repository on GitHub
2. Click the green **"Use this template"** button
3. Name your new repository (e.g., "client-website")
4. Click **"Create repository from template"**

### Step 2: Clone to Your Computer
1. Open **GitHub Desktop**
2. Click **File → Clone Repository**
3. Select your new repository
4. Choose where to save it
5. Click **Clone**

### Step 3: Deploy to Netlify
1. Log into [Netlify](https://netlify.com)
2. Click **"Add new site" → "Import an existing project"**
3. Choose **GitHub**
4. Select your repository
5. Click **"Deploy site"**
6. Your site is live!

---

## Installation Guide

### For Local Development (Optional)

#### Windows
1. **Download Hugo** from [releases page](https://github.com/gohugoio/hugo/releases)
   - Get `hugo_extended_0.129.0_windows-amd64.zip`
2. Extract to `C:\Hugo\bin`
3. Add to PATH:
   - Right-click "This PC" → Properties → Advanced → Environment Variables
   - Add `C:\Hugo\bin` to Path
4. Test: Open Command Prompt and type `hugo version`

#### Mac
```bash
brew install hugo
```

#### Linux
```bash
snap install hugo --channel=extended
```

### Install Dependencies
```bash
cd hugo-site
npm install  # Only if you want to use npm scripts
```

---

## Daily Usage

### Method 1: Edit Locally (Recommended)

1. **Start your day:**
   ```
   Open GitHub Desktop → Fetch Origin
   ```

2. **Edit content:**
   - Navigate to `hugo-site/content/`
   - Open any `.md` file with your text editor
   - Make changes
   - Save (Ctrl+S)

3. **Preview locally (optional):**
   ```bash
   cd hugo-site
   hugo server -D
   ```
   Open browser to http://localhost:1313

4. **Publish changes:**
   - Go to GitHub Desktop
   - Review changes
   - Write commit message (e.g., "Updated homepage")
   - Click "Commit to main"
   - Click "Push origin"
   - Site updates in 2-3 minutes!

### Method 2: CloudCannon Visual Editor

1. **Setup CloudCannon:**
   - Create account at [cloudcannon.com](https://cloudcannon.com)
   - Click "Add new site"
   - Connect your GitHub repository
   - Choose "Hugo" as build tool
   - See [CloudCannon Setup Guide](CLOUDCANNON_SETUP.md) for detailed instructions

2. **Daily editing:**
   - Login to CloudCannon
   - Click your site
   - Click any page to edit visually
   - Make changes (like using Word!)
   - Click "Save"
   - Changes go live automatically!

### Method 3: Netlify CMS (Free Alternative)

1. **Access the CMS:**
   - Go to `yoursite.com/admin`
   - Login with your Netlify Identity
   - Edit content in a user-friendly interface

2. **Daily editing:**
   - Navigate to Pages or Blog
   - Click to edit any content
   - Use the form fields to make changes
   - Click "Publish" to go live

---

## Features

### Built-in Functionality
- **Responsive Design** - Looks great on all devices
- **Ultra-Fast Loading** - Optimized for speed
- **Contact Forms** - Work instantly with Netlify
- **Video Embeds** - YouTube & Vimeo support
- **SEO Optimized** - Great Google rankings
- **Security Headers** - Enterprise-grade security
- **Accessible** - WCAG 2.1 AA compliant
- **Analytics Ready** - Just add your GA/GTM ID

### Performance Features
- Automatic image lazy loading
- CSS/JS minification
- Link prefetching
- Optimized caching
- CDN-ready assets

---

## Common Tasks

### Creating a New Page

1. **Create file:** `content/services.md`
2. **Add content:**
```markdown
---
title: "Our Services"
date: 2024-01-20
menu:
  main:
    weight: 25
---

# Our Services

We offer professional services to help your business grow.

## Web Development
Fast, modern websites that convert.

## SEO Services  
Improve your search rankings.

[Contact us](/contact/) to learn more!
```

### Adding Blog Posts

1. **Create file:** `content/blog/my-post.md`
2. **Add content:**
```markdown
---
title: "My Blog Post Title"
date: 2024-01-20
author: "Your Name"
image: "/images/blog-image.jpg"
---

Your blog post content here...
```

### Embedding Videos

**YouTube:**
```markdown
{{< youtube dQw4w9WgXcQ >}}
```

**Vimeo:**
```markdown
{{< vimeo 146022717 >}}
```

### Adding Images

1. **Save image to:** `static/images/your-image.jpg`
2. **Use in content:**
```markdown
![Image description](/images/your-image.jpg)
```

### Updating Site Settings

Edit `hugo.toml`:
```toml
title = "Your Business Name"
[params]
contact_email = "your@email.com"
contact_phone = "+1-555-123-4567"
```

### Managing Menus

Edit `hugo.toml`:
```toml
[[menu.main]]
name = "Services"
url = "/services/"
weight = 25

[[menu.main]]
name = "About"
url = "/about/"
weight = 30
```

---

## Configuration

### Essential Files

| File | Purpose |
|------|---------|
| `hugo.toml` | Main site configuration |
| `content/_index.md` | Homepage content |
| `content/blog/_index.md` | Blog listing page |
| `static/images/` | All images |
| `assets/css/custom.css` | Custom styles |
| `assets/js/app.js` | Site JavaScript |

### Environment Setup

Create `.env` file for local development:
```env
HUGO_BASE_URL=http://localhost:1313
CONTACT_EMAIL=your@email.com
```

### Netlify Configuration

Set environment variables in Netlify dashboard:
- `HUGO_VERSION` = 0.129.0
- `NODE_VERSION` = 18
- `TZ` = America/Los_Angeles

---

## Troubleshooting

### Common Issues & Solutions

#### "Site not updating"
- Did you push to GitHub?
- Check Netlify dashboard for build errors
- Wait 3-5 minutes for cache to clear

#### "Page not showing in menu"
Add to page frontmatter:
```yaml
menu:
  main:
    weight: 30
```

#### "Images not showing"
- Check path: `/images/filename.jpg`
- Ensure image is in `static/images/`
- File names are case-sensitive!

#### "Form not working"
Ensure form has:
```html
<form name="contact" method="POST" data-netlify="true">
```

#### "Build failing on Netlify"
Check build log for errors:
1. Go to Netlify dashboard
2. Click "Deploys"
3. Click failed deploy
4. Read error message

---

## Customization

### Change Colors
Edit `assets/css/custom.css`:
```css
:root {
  --primary-color: #0AA8A7;
  --secondary-color: #376f92;
}
```

### Add Custom CSS
Add to `assets/css/custom.css`

### Add Custom JavaScript
Add to `assets/js/app.js`

### Modify Theme
Edit files in `themes/bigspring/`

---

## Advanced Options

### Local Hugo Commands
```bash
hugo server -D        # Start local server with drafts
hugo new blog/post.md # Create new blog post
hugo --minify        # Build production site
```

### Performance Testing
```bash
npm run lighthouse   # Run Lighthouse audit
npm run test        # Run all tests
```

### Deployment Options
- **Netlify** (recommended) - Automatic from GitHub
- **Vercel** - Import GitHub repo
- **GitHub Pages** - Use GitHub Actions
- **Traditional hosting** - Upload `public/` folder

---

## Additional Resources

### Documentation
- [Hugo Documentation](https://gohugo.io/documentation/)
- [Bigspring Theme Docs](https://github.com/themefisher/bigspring)
- [Netlify Docs](https://docs.netlify.com/)
- [CloudCannon Docs](https://cloudcannon.com/documentation/)

### Quick References
- [Markdown Guide](https://www.markdownguide.org/basic-syntax/)
- [Hugo Shortcodes](https://gohugo.io/content-management/shortcodes/)
- [Netlify Forms](https://docs.netlify.com/forms/setup/)

### Setup Guides
- [Deployment Guide](DEPLOYMENT_GUIDE.md) - GitHub to Netlify auto-deployment
- [CloudCannon Setup](CLOUDCANNON_SETUP.md) - Visual CMS for non-developers
- [Quick Start Guide](QUICK_START.md) - 5-minute setup

### Support
- GitHub Issues (for bugs)
- Contact form on site
- Video tutorials in `/docs/`

---

## Contributing

Feel free to submit issues and enhancement requests!

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

## Quick Checklist

Before going live:
- [ ] Update `hugo.toml` with your details
- [ ] Change contact email
- [ ] Add your content
- [ ] Test contact form
- [ ] Connect Google Analytics
- [ ] Update favicon
- [ ] Test on mobile
- [ ] Check all links
- [ ] Review SEO settings
- [ ] Set up backups

---

**Made for non-developers** | Build fast, edit easily, deploy instantly!

**Your workflow:** Edit → Save → Push → Live!