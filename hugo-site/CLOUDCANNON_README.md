# CloudCannon WYSIWYG Configuration for Hugo Bigspring Theme

This Hugo site has been configured for visual editing with CloudCannon, enabling non-technical users to edit content without touching code.

## � Quick Start

### For CloudCannon Users

1. **Edit Homepage Sections**: Go to the "Collections" tab and select "Pages", then edit `_index.md`
2. **Add Blog Posts**: Navigate to "Collections" > "Blog" > "Add New Post"
3. **Edit Site Settings**: Use the "Data" tab to modify global settings
4. **Upload Images**: Use the "Assets" section to manage images and files

### Available Editing Options

#### Visual Editor
- **What it does**: WYSIWYG editing with drag-and-drop functionality
- **Best for**: Content editing, image placement, formatting
- **How to use**: Click "Visual" tab when editing pages

#### Content Editor
- **What it does**: Structured editing with forms
- **Best for**: Front matter configuration, structured content
- **How to use**: Click "Content" tab when editing pages

#### Data Editor
- **What it does**: Edit configuration files and global settings
- **Best for**: Site-wide settings, navigation, footer content
- **How to use**: Navigate to "Data" tab in main navigation

## � Content Management

### Homepage Sections

The homepage is built with configurable sections that can be enabled/disabled:

#### Banner Section
- **Purpose**: Hero banner with title, description, and call-to-action
- **Editable Elements**:
  - Title (supports HTML formatting)
  - Description text
  - Background image
  - Button text and link
- **Location**: `content/_index.md` → `banner` section

#### Features Section
- **Purpose**: Grid of features with icons and descriptions
- **Editable Elements**:
  - Section title
  - Individual features (name, icon, description)
  - Add/remove features
- **Icons**: Use FontAwesome classes (e.g., `fas fa-star`)
- **Location**: `content/_index.md` → `feature` section

#### Services Section
- **Purpose**: Showcase services with images and descriptions
- **Editable Elements**:
  - Service title and description
  - Multiple images per service
  - Call-to-action buttons
- **Location**: `content/_index.md` → `service` section

#### Screenshot Section
- **Purpose**: Display product screenshots or demos
- **Editable Elements**:
  - Section title
  - Large demo image
- **Location**: `content/_index.md` → `screenshot` section

#### Call-to-Action Section
- **Purpose**: Final conversion section with button
- **Editable Elements**:
  - CTA title and description
  - Side image
  - Button text and destination
- **Location**: `content/_index.md` → `call_to_action` section

### Blog Management

#### Creating Blog Posts
1. Go to Collections → Blog → Add New Post
2. Fill in the post details:
   - **Title**: Post headline
   - **Date**: Publication date
   - **Author**: Writer's name
   - **Description**: SEO meta description
   - **Featured Image**: Main post image
   - **Categories & Tags**: For organization
3. Write content using the Visual Editor
4. Save and publish

#### Blog Post Features
- **Rich Text Editor**: Format text, add images, links
- **Image Management**: Upload and embed images
- **SEO Settings**: Meta descriptions, categories, tags
- **Draft Mode**: Save drafts before publishing

### Site-Wide Settings

Edit global site settings in the Data section:

#### Site Settings (`_data/site_settings.yml`)
- **Branding**: Logo, colors, fonts
- **Navigation**: Header menu and buttons
- **Footer**: Company info, links, social media
- **Contact Information**: Address, phone, email
- **Theme Settings**: Light/dark mode, color scheme

#### Homepage Content (`_data/homepage.yml`)
- **Pre-configured Sections**: Ready-to-use content blocks
- **Easy Customization**: Change text, images, links
- **Testimonials**: Customer quotes and reviews
- **Statistics**: Key numbers and metrics

## � Customization Options

### Adding New Content Blocks

Use the available structures to add new sections:

#### Available Structures
- **Banner Blocks**: Hero sections, minimal banners
- **Feature Blocks**: Feature grids, individual features  
- **Service Blocks**: Service showcases, different layouts
- **Content Blocks**: Text sections, galleries, testimonials
- **Form Blocks**: Contact forms, newsletter signup

#### How to Add New Blocks
1. Edit the page in Content Editor
2. Find the section you want to add to
3. Click "Add Item" or "+"
4. Select from available block types
5. Configure the new block
6. Save changes

### Image Management

#### Upload Guidelines
- **Recommended Sizes**:
  - Banner images: 1200x800px
  - Service images: 600x400px
  - Blog featured images: 800x600px
  - Logo: 300x100px (PNG with transparency)
- **File Formats**: JPG, PNG, SVG, WebP
- **Optimization**: Compress images before upload for better performance

#### Image Locations
- **Site Assets**: `/assets/images/`
- **Blog Images**: `/assets/images/blog/`
- **Service Images**: Referenced in front matter
- **Logo/Favicon**: Configured in site settings

### Color and Styling

#### Theme Colors
Edit in `_data/site_settings.yml`:
```yaml
theme:
  colors:
    primary: "#0AA8A7"      # Main brand color
    secondary: "#376f92"    # Secondary color
    accent: "#ff6b6b"       # Accent color
```

#### Typography
Configure fonts:
```yaml
theme:
  fonts:
    primary: "Lato:wght@300;400;500;600;700"
    secondary: "Roboto:wght@300;400;500;700"
```

## � Mobile Optimization

All sections are automatically responsive and mobile-optimized:

- **Mobile Navigation**: Hamburger menu for small screens
- **Image Scaling**: Automatic image resizing
- **Touch-Friendly**: Buttons and links optimized for touch
- **Fast Loading**: Optimized for mobile networks

## � Technical Details

### File Structure
```
├── cloudcannon.config.yml          # Main CloudCannon configuration
├── _data/                           # Site-wide data files
│   ├── homepage.yml                # Homepage content
│   └── site_settings.yml           # Global settings
├── _structures/                     # Reusable content blocks
│   ├── banner.yml                  # Banner variations
│   ├── features.yml                # Feature types
│   ├── services.yml                # Service blocks
│   └── content_blocks.yml          # All content blocks
├── schemas/                         # Content templates
│   ├── page.md                     # Page template
│   └── blog-post.md                # Blog post template
└── layouts/partials/cloudcannon/   # Visual editing enhancements
    └── editable-sections.html      # Visual editor integration
```

### Content Types
- **Pages**: Static pages (About, Contact, etc.)
- **Blog**: Blog posts with rich content
- **Data**: Site settings and configuration

### Available Editors
- **Visual**: WYSIWYG editing with live preview
- **Content**: Form-based editing for structured data
- **Data**: Configuration file editing

## � Important Notes

### Content Guidelines
1. **Enable/Disable Sections**: Use the `enable: true/false` setting
2. **Image Paths**: Always use relative paths (e.g., `images/photo.jpg`)
3. **Button Links**: Use `/page-name/` format for internal links
4. **HTML in Text**: Limited HTML is allowed in title fields

### SEO Best Practices
1. **Page Titles**: Keep under 60 characters
2. **Meta Descriptions**: 150-160 characters ideal
3. **Image Alt Text**: Always add descriptive alt text
4. **Internal Linking**: Link between related pages

### Performance Tips
1. **Image Optimization**: Compress images before upload
2. **Lazy Loading**: Enabled automatically for images
3. **Caching**: CloudCannon handles caching automatically

## � Getting Help

### Common Tasks

#### Change Site Logo
1. Go to Data → Site Settings
2. Find "Branding" section
3. Upload new logo image
4. Adjust logo width if needed

#### Add New Page
1. Collections → Pages → Add New Page
2. Choose "Default" template
3. Configure sections as needed
4. Save and publish

#### Update Contact Information
1. Data → Site Settings
2. Find "Contact" section
3. Update phone, email, address
4. Save changes

#### Modify Navigation Menu
1. Data → Site Settings  
2. Find "Footer" → "Sections"
3. Edit existing links or add new ones
4. Save changes

### Support Resources
- **CloudCannon Documentation**: [docs.cloudcannon.com](https://docs.cloudcannon.com)
- **Hugo Documentation**: [gohugo.io/documentation](https://gohugo.io/documentation/)
- **Bigspring Theme**: Check theme documentation for specific features

---

**Ready to start editing?** Log into CloudCannon and begin customizing your site! �