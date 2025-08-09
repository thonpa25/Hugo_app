# Ä Quick Start Guide - 5 Minutes to Your First Edit!

## For Non-Developers: Your Simple Workflow

### ù Method 1: Edit Content Locally (Recommended)

#### Step 1: Get the Site on Your Computer
1. Open **GitHub Desktop**
2. Click **"Clone a Repository"**
3. Select your site from the list
4. Click **"Clone"**

#### Step 2: Make Your Changes
1. Go to the `hugo-site/content` folder on your computer
2. Open any `.md` file with **Notepad** or any text editor
3. Make your changes (just edit the text!)
4. Save the file (Ctrl+S)

#### Step 3: Publish Your Changes
1. Go back to **GitHub Desktop**
2. You'll see your changes listed
3. Type a short message like "Updated homepage"
4. Click **"Commit to main"**
5. Click **"Push origin"**
6.  **Done!** Your site updates in 2-3 minutes

---

### ê Method 2: Edit Online with CloudCannon

1. Go to **CloudCannon.com** and login
2. Click on your site
3. Click any page to edit it visually
4. Make your changes (like using Word!)
5. Click **"Save"**
6.  **Done!** Changes are live immediately

---

## Ñ Creating a New Page (Super Easy!)

### Example: Adding a "Services" Page

1. **Copy this template** into a new file called `services.md`:

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
Creating fast, modern websites that convert visitors into customers.

## SEO Services
Improving your search rankings to bring more traffic to your site.

## Content Marketing
Engaging content that builds trust with your audience.

[Contact us](/contact/) to learn more!
```

2. Save it in `hugo-site/content/services.md`
3. Push to GitHub (see Method 1, Step 3)
4. The page appears at `yoursite.com/services/`

---

## ß Contact Form (Already Working!)

Your contact form is ready! Just tell people to go to `/contact/`

To change where emails go:
1. Open `hugo.toml`
2. Find `contact_email = "dan@theonlinepart.com"`
3. Change to your email
4. Save and push

---

## • Adding Videos

### YouTube Video
In any page, type:
```
{{< youtube dQw4w9WgXcQ >}}
```
(Replace `dQw4w9WgXcQ` with the video ID from YouTube URL)

### Vimeo Video
```
{{< vimeo 146022717 >}}
```
(Replace `146022717` with the Vimeo video ID)

---

## º Adding Images

1. Put your image in `hugo-site/static/images/`
2. In your content, use:
```markdown
![Description of image](/images/your-image.jpg)
```

---

## ® Common Edits

### Change Site Title
Edit `hugo.toml`:
```toml
title = 'Your Business Name'
```

### Update Footer Text
Edit theme files in `themes/bigspring/layouts/partials/footer.html`

### Add Menu Item
Edit `hugo.toml`:
```toml
[[menu.main]]
name = "Services"
url = "/services/"
weight = 25
```

---

## Pro Tips

### Test Locally (Optional)
If you want to preview before pushing:
1. Open Command Prompt in `hugo-site` folder
2. Type: `hugo server`
3. Open browser to `http://localhost:1313`
4. Press Ctrl+C to stop

### Markdown Basics
- **Bold**: `**text**`
- *Italic*: `*text*`
- Link: `[text](url)`
- Heading: `# Big` `## Medium` `### Small`
- List: Start lines with `-` or `1.`

---

## ò Quick Fixes

### "Site not updating"
- Did you click "Push" in GitHub Desktop?
- Wait 3-5 minutes for Netlify to build
- Check Netlify dashboard for errors

### "Page not showing in menu"
Add to the page's front matter:
```yaml
menu:
  main:
    weight: 30
```

### "Images not showing"
- Check the path: `/images/filename.jpg`
- Make sure image is in `static/images/`

---

## ± Need More Help?

1. **Check the full README.md** for detailed instructions
2. **Visit Netlify dashboard** to see build status
3. **CloudCannon support** for visual editing help

---

**Remember:** You're just editing text files! Don't overthink it. Edit ‚Üí Save ‚Üí Push ‚Üí Done! â

**Your workflow:** GitHub Desktop for content, CloudCannon for quick edits, Netlify handles the rest!