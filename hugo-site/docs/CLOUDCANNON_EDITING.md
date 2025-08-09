# CloudCannon Visual Editing Guide

This guide shows you how to edit your Hugo site using CloudCannon's visual editor. Think of it like editing a Word document - you can see your changes immediately without needing to know any code.

## What You'll Accomplish

By the end of this guide, you'll be able to:
- Edit any page content visually
- Add new blog posts and pages
- Upload and manage images
- Update contact forms and maps
- Customize homepage sections
- Manage site settings and navigation

## Getting Started

### Accessing CloudCannon

1. **Login URL**: Your CloudCannon admin panel URL (provided by your developer)
   - Usually looks like: `https://app.cloudcannon.com/sites/your-site`
   - Or: `https://your-site.cloudcannon.com`

2. **Login**
   - Enter your email and password
   - If you don't have login details, ask your developer

3. **Dashboard Overview**
   - You'll see your site dashboard
   - Main sections: Pages, Collections, Files, Settings

**Screenshot Placeholder**: CloudCannon login and dashboard

## Understanding the Interface

### Main Navigation

**Pages**: All your website pages (homepage, about, contact, etc.)  
**Collections**: Blog posts and other content types  
**Files**: Images, documents, and other media  
**Settings**: Site configuration and global settings

### Editor Modes

**Visual Editor**: See your page as visitors will see it  
**Content Editor**: Focus on text content with formatting tools  
**Data Editor**: Edit page settings and metadata  
**Source Editor**: View the raw code (advanced users only)

**Screenshot Placeholder**: CloudCannon editor modes interface

## Editing Existing Pages

### Step 1: Open a Page

1. **Navigate to Pages**
   - Click "Pages" in the main navigation
   - You'll see a list of all your pages

2. **Select Page to Edit**
   - Click on any page (e.g., "Homepage", "About", "Contact")
   - The page will open in the Visual Editor

**Screenshot Placeholder**: Pages list in CloudCannon

### Step 2: Make Changes

1. **Edit Text**
   - Click on any text to start editing
   - Type directly to replace text
   - Use formatting toolbar for bold, italic, links, etc.

2. **Edit Images**
   - Click on any image
   - Click "Replace" to upload new image
   - Or click "Edit" to adjust settings

3. **Save Changes**
   - Changes save automatically as you type
   - Green "Saved" indicator appears when complete

**Screenshot Placeholder**: Visual editing in action

### Step 3: Preview and Publish

1. **Preview Changes**
   - Click "Preview" button (eye icon)
   - Opens your site in new tab
   - Shows exactly how visitors will see it

2. **Publish Changes**
   - Click "Publish" button
   - Changes go live immediately
   - No technical steps required!

**Screenshot Placeholder**: Preview and publish buttons

## Adding New Content

### Adding Blog Posts

1. **Go to Collections**
   - Click "Collections" in main navigation
   - Click "Blog" collection

2. **Create New Post**
   - Click "Add" button
   - Choose "Blog Post" template
   - New post opens in editor

3. **Fill in Post Details**
   - **Title**: Your blog post title
   - **Date**: Publication date
   - **Author**: Your name
   - **Featured Image**: Upload main image
   - **Tags**: Keywords for organizing posts
   - **Content**: Write your blog post

4. **Write Content**
   - Use the Visual Editor like a word processor
   - Add headings, bullet points, images
   - Format text with toolbar options

5. **Publish**
   - Click "Publish" when ready
   - Post appears on your blog page

**Screenshot Placeholder**: Creating new blog post

### Adding New Pages

1. **Go to Pages**
   - Click "Pages" in main navigation

2. **Create New Page**
   - Click "Add" button
   - Choose page template (usually "Page")

3. **Configure Page**
   - **Title**: Page name
   - **URL**: Web address (auto-generated from title)
   - **Description**: For SEO and search engines
   - **Content**: Page content

4. **Add to Navigation** (if needed)
   - Go to Settings → Navigation
   - Add your new page to menu

## Managing Images and Media

### Uploading Images

1. **Go to Files**
   - Click "Files" in main navigation
   - Navigate to "assets" → "images"

2. **Upload Images**
   - Click "Add" button
   - Choose "Upload Files"
   - Drag and drop images or click to browse
   - Images upload automatically

3. **Organize Images**
   - Create folders for different types (blog, services, team, etc.)
   - Move images into appropriate folders
   - Use descriptive file names

**Screenshot Placeholder**: File upload interface

### Using Images in Content

1. **While Editing Content**
   - Place cursor where you want image
   - Click image icon in toolbar
   - Choose "Browse" to select existing image
   - Or "Upload" to add new image

2. **Image Settings**
   - **Alt Text**: Description for accessibility (required)
   - **Caption**: Optional text below image
   - **Size**: Small, medium, large, or custom
   - **Alignment**: Left, center, right

### Image Best Practices

- **File Names**: Use descriptive names like `team-photo-2024.jpg`
- **File Sizes**: Keep under 1MB for web performance
- **Alt Text**: Always add for accessibility
- **Folders**: Organize by topic (blog/, team/, services/)

## Customizing Homepage Sections

Your homepage is built from sections that you can edit independently:

### Banner Section

1. **Open Homepage**
   - Go to Pages → Homepage
   - Look for "Banner" section

2. **Edit Banner Content**
   - **Title**: Main headline (can include HTML for styling)
   - **Content**: Description text below title
   - **Image**: Background or feature image
   - **Button**: Call-to-action button text and link

3. **Styling Options**
   - Primary color for button
   - Text alignment
   - Background options

**Screenshot Placeholder**: Banner section editing

### Features Section

1. **Find Features Section**
   - On homepage, scroll to features area
   - Click to edit

2. **Add/Edit Features**
   - **Feature Title**: Name of the feature
   - **Icon**: Choose from FontAwesome icons
   - **Description**: Explain the feature
   - **Order**: Drag to reorder features

3. **Common Icons**
   - `fas fa-star` - Star
   - `fas fa-heart` - Heart
   - `fas fa-check` - Checkmark
   - `fas fa-phone` - Phone
   - `fas fa-envelope` - Email
   - `fas fa-map` - Map

### Services Section

1. **Edit Services**
   - Find services section on homepage
   - Click to edit

2. **Service Details**
   - **Title**: Service name
   - **Images**: Add multiple service images
   - **Description**: What you offer
   - **Button**: Link to more details

3. **Managing Service Images**
   - Upload to `assets/images/services/`
   - Use consistent image sizes
   - Add alt text for accessibility

### Call-to-Action Section

1. **Edit CTA**
   - **Title**: Compelling headline
   - **Content**: Persuasive description
   - **Image**: Supporting visual
   - **Button**: Clear action (e.g., "Contact Us", "Get Started")

2. **Best Practices**
   - Keep title short and action-oriented
   - Make button text specific
   - Use contrasting colors for button

## Contact Forms and Maps

### Editing Contact Forms

1. **Open Contact Page**
   - Go to Pages → Contact

2. **Form Settings**
   - **Destination Email**: Where submissions go
   - **Subject**: Email subject line
   - **Success Page**: Where users go after submitting
   - **reCAPTCHA**: Enable/disable spam protection

3. **Form Fields**
   - Standard fields: Name, Email, Message
   - Add custom fields if needed
   - Set required vs optional fields

**Screenshot Placeholder**: Contact form editing

### Adding Google Maps

1. **Get API Key** (one-time setup)
   - Go to Google Cloud Console
   - Enable Maps API
   - Create API key
   - Add key to Site Settings

2. **Add Map to Page**
   - While editing content, click map icon
   - Or use shortcode: `{{< google-map >}}`

3. **Map Settings**
   - **Address**: Street address to show
   - **Zoom Level**: How close to zoom in
   - **Style**: Default, satellite, terrain
   - **Controls**: Show/hide map controls

## Site Settings Management

### Global Settings

1. **Go to Settings**
   - Click "Settings" in main navigation

2. **Site Information**
   - **Site Title**: Your website name
   - **Description**: Site description for search engines
   - **Author**: Your name or company
   - **Logo**: Upload your logo image
   - **Favicon**: Small icon for browser tabs

3. **Contact Information**
   - **Email**: Primary contact email
   - **Phone**: Contact phone number
   - **Address**: Business address

4. **Colors and Branding**
   - **Primary Color**: Main brand color
   - **Secondary Color**: Accent color
   - **Fonts**: Choose from Google Fonts

**Screenshot Placeholder**: Site settings interface

### Navigation Menu

1. **Edit Menu**
   - Settings → Navigation
   - See current menu items

2. **Add Menu Item**
   - Click "Add Item"
   - **Name**: Text shown in menu
   - **URL**: Page to link to
   - **Weight**: Order in menu (lower numbers first)

3. **Dropdown Menus**
   - Set parent item
   - Add child items with same parent
   - Creates automatic dropdown

### Social Media Links

1. **Social Settings**
   - Settings → Social Media
   - Add links to your profiles

2. **Supported Platforms**
   - Facebook, Twitter, LinkedIn, Instagram
   - YouTube, TikTok, Pinterest
   - Custom links for other platforms

## Advanced Content Features

### Video Embeds

1. **YouTube Videos**
   - Get video ID from YouTube URL
   - Use video shortcode: `{{< youtube VIDEO_ID >}}`

2. **Vimeo Videos**
   - Get video ID from Vimeo URL
   - Use vimeo shortcode: `{{< vimeo VIDEO_ID >}}`

3. **Video Settings**
   - **Autoplay**: Start automatically (not recommended)
   - **Controls**: Show/hide player controls
   - **Privacy**: Use privacy-enhanced mode

### Content Blocks

CloudCannon provides reusable content blocks:

1. **Banner Blocks**
   - Hero sections with title, text, image, button
   - Multiple layout options

2. **Feature Blocks**
   - Highlight key features or benefits
   - Icons, titles, descriptions

3. **Service Blocks**
   - Showcase your services
   - Images, descriptions, links

4. **Testimonial Blocks**
   - Customer reviews and feedback
   - Photos and quotes

**Screenshot Placeholder**: Content blocks interface

### SEO Settings

For each page/post:

1. **Meta Description**
   - Brief description for search results
   - Keep under 160 characters
   - Include important keywords

2. **SEO Title**
   - Title shown in search results
   - Can be different from page title
   - Include keywords naturally

3. **Featured Image**
   - Image shown when page is shared
   - Appears in social media previews
   - Use high-quality, relevant images

## Workflow Tips

### Daily Content Management

1. **Start with Preview**
   - Always preview changes before publishing
   - Check mobile view
   - Test all links

2. **Content Planning**
   - Use draft status for work-in-progress
   - Schedule posts for future dates
   - Keep content calendar organized

3. **Regular Maintenance**
   - Update outdated information monthly
   - Check all forms work properly
   - Remove old/irrelevant content

### Working with Teams

1. **User Roles**
   - Admin: Full access to everything
   - Editor: Content and media only
   - Viewer: Read-only access

2. **Content Review Process**
   - Use draft status for review
   - Add comments for feedback
   - Publish only when approved

3. **Change Management**
   - Communicate major changes
   - Keep backup of important content
   - Test changes in staging first

## Troubleshooting Common Issues

### Editor Won't Load

**Try:**
1. Refresh browser page
2. Clear browser cache
3. Try different browser
4. Check internet connection

### Changes Not Appearing

**Check:**
1. Did you click "Publish"?
2. Wait 2-3 minutes for deployment
3. Clear browser cache
4. Check you're looking at correct page

### Images Not Uploading

**Solutions:**
1. Check file size (must be under 10MB)
2. Use supported formats (JPG, PNG, GIF, SVG)
3. Check file name (avoid special characters)
4. Try different browser

### Forms Not Working

**Verify:**
1. Correct email address in settings
2. Form fields configured properly
3. Spam protection not blocking submissions
4. Check spam folder for submissions

### Can't Edit Certain Sections

**Possible Causes:**
1. Insufficient user permissions
2. Content locked by another editor
3. Template doesn't support editing
4. Browser compatibility issue

## Best Practices

### Content Writing

- **Headlines**: Clear, descriptive, include keywords
- **Paragraphs**: Keep short (2-3 sentences)
- **Images**: Always add alt text
- **Links**: Use descriptive link text
- **Mobile**: Preview on mobile devices

### SEO Optimization

- **Keywords**: Use naturally in content
- **Meta Descriptions**: Unique for each page
- **Image Alt Text**: Descriptive and relevant
- **URL Structure**: Clean and readable
- **Internal Links**: Link to related content

### Performance

- **Image Sizes**: Optimize for web
- **Content Length**: Break up long pages
- **External Links**: Open in new tabs
- **Regular Updates**: Keep content fresh

## Getting Help

### Built-in Help

1. **CloudCannon Documentation**
   - Help icon in interface
   - Comprehensive guides
   - Video tutorials

2. **Live Preview**
   - Always use preview before publishing
   - Shows exactly how site will look

### When Things Go Wrong

1. **Undo Changes**
   - Most changes can be reverted
   - Check revision history

2. **Contact Support**
   - CloudCannon has excellent support
   - Include specific error messages
   - Describe what you were trying to do

---

**Congratulations!** � You now have complete control over your Hugo site through CloudCannon's visual editor. No coding required - just click, edit, and publish!

**Next Steps:**
- Start with small edits to build confidence
- Add your first blog post
- Customize your homepage sections
- Set up your contact forms and maps
- Explore advanced features as needed

**For bulk operations or team workflows**, check out the [GitHub Desktop Workflow Guide](GITHUB_DESKTOP_WORKFLOW.md).