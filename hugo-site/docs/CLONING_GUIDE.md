# Cloning Guide: Using This Site as a Template

This guide shows you how to use your current Hugo site as a template to create new websites. Perfect for agencies, freelancers, or anyone who wants to reuse this setup.

## What You'll Accomplish

By the end of this guide, you'll have:
- A complete copy of your site as a new project
- All the same features and functionality
- Customized branding and content
- Independent hosting and domain setup

## When to Clone Your Site

**Great for:**
- Creating sites for new clients
- Building similar business directory sites
- Starting new projects with proven structure
- A/B testing different approaches
- Creating staging/testing environments

**Not needed for:**
- Adding new pages to existing site (just use CloudCannon)
- Making content changes (use normal editing workflow)
- Testing small changes (use local development)

## Method 1: GitHub Template (Easiest)

### Step 1: Create Template Repository

1. **Go to Your Current Repository**
   - Navigate to your site's GitHub page
   - Click "Settings" (in the repository, not your account)

2. **Enable Template**
   - Scroll to "Template repository" section
   - Check "Template repository" box
   - Click "Update"

**Screenshot Placeholder**: GitHub template repository settings

### Step 2: Create New Site from Template

1. **Use Template**
   - Go to your repository homepage
   - Click green "Use this template" button
   - Click "Create a new repository"

2. **Configure New Repository**
   - **Repository name**: `client-name-website` or similar
   - **Description**: Brief description of new site
   - **Visibility**: Usually Private for client work
   - Click "Create repository"

**Screenshot Placeholder**: Creating repository from template

### Step 3: Clone and Customize

1. **Clone New Repository**
   ```bash
   git clone https://github.com/yourusername/new-site-name.git
   cd new-site-name
   ```

2. **Update Site Configuration**
   - Edit `hugo.toml`:
   ```toml
   baseURL = 'https://new-domain.com/'
   title = 'New Site Title'
   
   [params]
   description = "New site description"
   author = "Client Name"
   contact_email = "client@newdomain.com"
   ```

3. **Update CloudCannon Config**
   - Edit `cloudcannon.config.yml`
   - Update site name and descriptions
   - Customize input labels if needed

## Method 2: Manual Fork (More Control)

### Step 1: Fork Repository

1. **Fork on GitHub**
   - Go to your original repository
   - Click "Fork" button (top right)
   - Choose destination account
   - Rename if desired

2. **Clone Fork**
   ```bash
   git clone https://github.com/yourusername/forked-site.git
   cd forked-site
   ```

### Step 2: Remove Original History (Optional)

If you want a clean start:

```bash
# Remove original git history
rm -rf .git

# Initialize new repository
git init
git add .
git commit -m "Initial commit for new site"

# Connect to new remote repository
git remote add origin https://github.com/yourusername/new-site.git
git push -u origin main
```

## Step 3: Customization Checklist

### Essential Updates

- [ ] **Site Configuration** (`hugo.toml`)
  - [ ] `baseURL`
  - [ ] `title`
  - [ ] `params.description`
  - [ ] `params.author`
  - [ ] `params.contact_email`
  - [ ] `params.contact_phone`

- [ ] **Content Files**
  - [ ] `content/_index.md` (homepage)
  - [ ] `content/contact.md`
  - [ ] Remove/replace blog posts in `content/blog/`
  - [ ] Update about page content

- [ ] **Data Files**
  - [ ] `data/site_settings.yml`
  - [ ] `data/homepage.yml`
  - [ ] Navigation menus

- [ ] **Assets**
  - [ ] Replace logo: `assets/images/logo.png`
  - [ ] Replace favicon: `assets/images/favicon.png`
  - [ ] Update banner images
  - [ ] Replace service images

### Visual Customization

- [ ] **Colors** (in `hugo.toml`)
  ```toml
  [params.variables]
  color_primary = "#0AA8A7"    # Change to client brand color
  color_secondary = "#376f92"   # Change to secondary color
  ```

- [ ] **Fonts** (in `hugo.toml`)
  ```toml
  font_primary = "Lato:wght@300;400;500;600;700"
  ```

- [ ] **Custom CSS** (`assets/scss/custom.scss`)
  - Add client-specific styling
  - Override theme defaults

### CloudCannon Configuration

- [ ] **Collections** (`cloudcannon.config.yml`)
  - Update collection descriptions
  - Customize input labels
  - Add client-specific fields

- [ ] **Editor Settings**
  - Customize available editing options
  - Set up client-friendly labels

### Content Strategy

- [ ] **Homepage Sections**
  - [ ] Update banner content
  - [ ] Customize feature sections
  - [ ] Update service offerings
  - [ ] Modify call-to-action sections

- [ ] **Sample Content**
  - [ ] Remove placeholder blog posts
  - [ ] Add client's actual content
  - [ ] Update demo pages

## Method 3: Advanced Cloning with Customization

### Step 1: Create Customization Script

Create `customize-site.sh`:

```bash
#!/bin/bash
# Site customization script

# Get new site details
read -p "New site name: " SITE_NAME
read -p "Client name: " CLIENT_NAME
read -p "Domain (without https://): " DOMAIN
read -p "Contact email: " CONTACT_EMAIL
read -p "Primary color (hex): " PRIMARY_COLOR

# Update hugo.toml
sed -i "s/My Hugo Site with Bigspring/$SITE_NAME/" hugo.toml
sed -i "s/http:\/\/localhost:1313\//https:\/\/$DOMAIN\//" hugo.toml
sed -i "s/dan@theonlinepart.com/$CONTACT_EMAIL/" hugo.toml
sed -i "s/#0AA8A7/$PRIMARY_COLOR/" hugo.toml

# Update homepage
sed -i "s/Your Name/$CLIENT_NAME/" content/_index.md

echo "Basic customization complete!"
echo "Next steps:"
echo "1. Replace logo and images"
echo "2. Update content files"
echo "3. Test with 'hugo server'"
```

### Step 2: Run Customization

```bash
chmod +x customize-site.sh
./customize-site.sh
```

## Setting Up New Hosting

### Option 1: Netlify (Recommended)

1. **Connect Repository**
   - Go to https://netlify.com
   - Click "New site from Git"
   - Choose GitHub and select your new repository

2. **Configure Build Settings**
   - **Build command**: `hugo`
   - **Publish directory**: `public`
   - **Hugo version**: Set in environment variables: `HUGO_VERSION = 0.120.4`

3. **Custom Domain**
   - In Netlify dashboard: Site Settings â†’ Domain Management
   - Add your custom domain
   - Follow DNS configuration instructions

**Screenshot Placeholder**: Netlify deployment settings

### Option 2: CloudCannon

1. **Create New Site**
   - Log into CloudCannon
   - Click "Create Site"
   - Connect your new GitHub repository

2. **Configure Build**
   - Choose Hugo as build type
   - Set Hugo version to match your local setup
   - Configure build settings

3. **Set Up Editing**
   - CloudCannon will use your `cloudcannon.config.yml`
   - Test editing interface
   - Customize as needed for client

### Option 3: Vercel

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy from your project directory
vercel
```

## Client Handoff Process

### Prepare for Handoff

1. **Clean Up Repository**
   - Remove any test content
   - Ensure all placeholder text is replaced
   - Add real content and images

2. **Documentation**
   - Copy these documentation files
   - Update any site-specific instructions
   - Create client-specific quick start guide

3. **Testing**
   - Test all forms and functionality
   - Check mobile responsiveness
   - Verify all links work
   - Test CloudCannon editing interface

### Client Training Package

Create a client-specific folder with:
- [ ] **Quick Start Guide** (customized version of main README)
- [ ] **CloudCannon Login Details** (admin URL, credentials)
- [ ] **Domain & Hosting Information** (DNS settings, hosting dashboard access)
- [ ] **Content Templates** (example blog posts, page layouts)
- [ ] **Brand Guidelines** (colors, fonts, imagery guidelines)
- [ ] **Emergency Contacts** (your contact info, hosting support)

## Maintenance Considerations

### Updates Strategy

**For Template Repository:**
- Keep updated with latest Hugo version
- Add new features and improvements
- Maintain security updates
- Document changes for existing clones

**For Individual Client Sites:**
- Plan for periodic updates
- Test updates in staging first
- Consider maintenance contracts
- Document custom modifications

### Version Control

```bash
# Add original repository as upstream (for updates)
git remote add upstream https://github.com/yourusername/original-site.git

# Periodically pull updates
git fetch upstream
git merge upstream/main
```

## Troubleshooting Cloning Issues

### Common Problems

**Hugo Version Mismatch**
```bash
# Check Hugo version
hugo version

# Update if needed (Mac)
brew upgrade hugo

# Update if needed (Windows)
# Download new version from GitHub releases
```

**Missing Dependencies**
```bash
# Reinstall Node.js dependencies
rm -rf node_modules
npm install

# Reinstall Python dependencies
pip install -r scripts/requirements.txt
```

**Build Failures**
```bash
# Check for errors
hugo check

# Clean build cache
hugo --gc
```

### Environment Issues

**Different Operating Systems**
- Windows line endings vs Unix
- Path separator differences
- Case sensitivity issues

**Solution**: Use consistent development environment or Docker

## Advanced: Docker-Based Cloning

Create `Dockerfile`:

```dockerfile
FROM hugomods/hugo:latest

WORKDIR /src
COPY . /src/

RUN hugo mod get

EXPOSE 1313

CMD ["hugo", "server", "--bind=0.0.0.0", "--disableFastRender"]
```

Create `docker-compose.yml`:

```yaml
version: '3'
services:
  hugo:
    build: .
    ports:
      - "1313:1313"
    volumes:
      - .:/src
    command: hugo server --bind=0.0.0.0 --disableFastRender
```

Run with:
```bash
docker-compose up
```

## Quality Checklist

Before delivering cloned site:

### Technical
- [ ] Hugo builds without errors
- [ ] All links work (internal and external)
- [ ] Images load properly
- [ ] Forms submit correctly
- [ ] Mobile responsive
- [ ] Fast loading times
- [ ] SEO basics configured

### Content
- [ ] No placeholder text remains
- [ ] All contact information updated
- [ ] Brand colors and fonts applied
- [ ] Logo and favicon replaced
- [ ] Relevant sample content added

### Client Experience
- [ ] CloudCannon editing works smoothly
- [ ] Client can add new content
- [ ] Client can manage images
- [ ] Forms deliver to correct email
- [ ] Analytics tracking configured

---

**Success!** ‰ You now have a complete process for cloning your Hugo site for new projects. Each clone maintains all the powerful features while being completely independent.

**Next Steps:**
- Set up your template repository
- Create your first clone
- Develop a standard customization process
- Build your client handoff workflow