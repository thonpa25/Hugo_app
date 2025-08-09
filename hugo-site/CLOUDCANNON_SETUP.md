#  CloudCannon CMS Setup Guide

This guide will help you connect your Hugo site to CloudCannon for visual editing - no coding required!

## ã What You'll Need

- Your Hugo site on GitHub (already done!)
- A CloudCannon account (free trial available)
- 10 minutes of your time

## Ä Quick Setup (5 Steps)

### Step 1: Create CloudCannon Account

1. Go to [CloudCannon.com](https://cloudcannon.com)
2. Click **"Start Free Trial"** (no credit card required)
3. Sign up with your email or GitHub account

### Step 2: Connect Your Repository

1. In CloudCannon, click **"Add new site"**
2. Select **"Connect your own GitHub repository"**
3. Choose **"GitHub"** as your Git provider
4. Authorize CloudCannon to access your GitHub
5. Select your `hugo-site` repository
6. Click **"Use Repository"**

### Step 3: Configure Build Settings

CloudCannon will auto-detect Hugo! Just verify these settings:

- **Site Name**: Your Site Name
- **Branch**: main
- **Source**: /
- **Static Site Generator**: Hugo (auto-detected)

Click **"Build Site"**

### Step 4: Wait for Initial Build

CloudCannon will:
1. Clone your repository
2. Install Hugo
3. Build your site
4. Make it editable

This takes about 2-3 minutes. ‚òï Time for coffee!

### Step 5: Start Editing!

Once built, you'll see your site dashboard with:
- **Visual Editor** - Click any page to edit visually
- **Content Editor** - Edit in a simple form interface
- **Source Editor** - For those who know Markdown

## ® Visual Editing Features

### What You Can Edit Visually

- ‚úè **Text** - Click any text to edit directly
- º **Images** - Click to replace or resize
- ó **Links** - Update URLs easily
- ù **Blog Posts** - Write like in Word
- Ñ **Pages** - Edit any page content
- ® **Styles** - Some style options available

### How to Edit Content

1. **Navigate** to the page you want to edit
2. **Click** the "Edit" button (pencil icon)
3. **Make changes** directly on the page
4. **Save** your changes
5. **Publish** to make them live

## Å Understanding the Structure

CloudCannon organizes your content into collections:

### Pages Collection
- Location: `content/` folder
- What: Main website pages
- Examples: Home, About, Services, Contact

### Blog Collection
- Location: `content/blog/` folder
- What: Blog posts and articles
- Examples: News, Updates, Tutorials

### Data Files
- Location: `data/` folder
- What: Site configuration and settings
- Examples: Navigation, footer text, social links

## † Common Tasks in CloudCannon

### Creating a New Page

1. Click **"Pages"** in sidebar
2. Click **"Add Page"** button
3. Fill in:
   - Title: Your Page Title
   - Content: Your page content
   - URL: /your-page/
4. Click **"Create Page"**
5. Click **"Publish"**

### Adding a Blog Post

1. Click **"Blog"** in sidebar
2. Click **"Add Blog Post"**
3. Fill in:
   - Title: Post Title
   - Date: Today's date
   - Author: Your name
   - Content: Write your post
4. Click **"Create Post"**
5. Click **"Publish"**

### Uploading Images

1. Click **"Assets"** in sidebar
2. Navigate to `images` folder
3. Click **"Upload"**
4. Select your images
5. Use in content: `![Description](/images/your-image.jpg)`

### Editing Navigation Menu

1. Go to **"Data Files"**
2. Open `navigation.yml` or edit in `hugo.toml`
3. Add/edit menu items
4. Save changes

## Ø CloudCannon-Specific Features

### Editor Modes

- **Visual Editor**: WYSIWYG editing for non-technical users
- **Content Editor**: Form-based editing with fields
- **Source Editor**: Direct Markdown/YAML editing

### Publishing Workflow

1. **Draft Mode**: Save changes without publishing
2. **Preview**: See changes before going live
3. **Publish**: Make changes live on your site
4. **History**: View and restore previous versions

### Collaboration Features

- **Team Members**: Invite editors and reviewers
- **Roles**: Set permissions (Editor, Developer, Owner)
- **Comments**: Leave notes on content
- **Approval Workflow**: Review before publishing

## ß Advanced Configuration

### Custom Editor Settings

The `cloudcannon.config.yml` file controls:
- Which fields appear in forms
- How content is organized
- Editor permissions
- Input types and validations

### Schemas

Templates in `.cloudcannon/schemas/` provide:
- Starting templates for new content
- Consistent structure
- Default values
- Helper text

## ö CloudCannon vs Netlify CMS

### CloudCannon Advantages
- True visual editing (WYSIWYG)
- No technical setup required
- Better for non-technical users
- Real-time preview
- Built-in image editing
- Professional support

### Netlify CMS Advantages
- Completely free
- Open source
- Integrates with Netlify Identity
- More developer control
- Works offline

## ® Troubleshooting

### "Build Failed" Error
- Check `hugo.toml` for syntax errors
- Verify Hugo version in CloudCannon matches local
- Check for missing images or broken links

### "Can't Edit Content"
- Ensure you're logged in
- Check your user permissions
- Verify the page has editable regions

### "Changes Not Showing"
- Click "Publish" after saving
- Clear browser cache
- Wait 1-2 minutes for changes to propagate

### "Visual Editor Not Working"
- Some complex layouts may need Content Editor
- Check if JavaScript is enabled
- Try refreshing the page

## ö Resources

### CloudCannon Documentation
- [Getting Started](https://cloudcannon.com/documentation/)
- [Hugo Guide](https://cloudcannon.com/documentation/guides/hugo-starter-guide/)
- [Visual Editing](https://cloudcannon.com/documentation/articles/defining-editable-regions-in-your-html/)

### Video Tutorials
- [CloudCannon + Hugo Setup](https://www.youtube.com/watch?v=example)
- [Visual Editing Basics](https://www.youtube.com/watch?v=example)

### Support
- CloudCannon Support: support@cloudcannon.com
- Community Forum: [forum.cloudcannon.com](https://forum.cloudcannon.com)
- Live Chat: Available in CloudCannon dashboard

## Setup Checklist

- [ ] Created CloudCannon account
- [ ] Connected GitHub repository
- [ ] Site successfully built
- [ ] Tested visual editing
- [ ] Created a test page
- [ ] Published changes
- [ ] Invited team members
- [ ] Configured permissions

## â You're Ready!

Your site is now connected to CloudCannon! You can:
- Edit content visually without code
- Manage your blog and pages
- Upload images and files
- Collaborate with your team
- Publish changes instantly

**Remember**: CloudCannon saves to GitHub, so all changes are version-controlled and backed up automatically!

---

**Need the free alternative?** Your site also includes Netlify CMS configuration at `/admin`. Just add this to your site's `<head>`:

```html
<script src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
```

Then visit `yoursite.com/admin` to access Netlify CMS!