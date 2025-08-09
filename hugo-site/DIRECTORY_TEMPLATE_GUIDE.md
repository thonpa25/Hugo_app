# � Directory Template Guide

Complete guide for creating and managing directory listings on your Hugo site.

## � Overview

The directory template system allows you to create business listings, member directories, resource catalogs, or any type of structured directory content. It supports both data-driven (YAML/JSON) and content-driven (Markdown) approaches.

## � Directory Structure

```
hugo-site/
├── data/
│   └── directory_example.yml     # Data-driven listings
├── content/
│   └── directory/
│       ├── _index.md             # Directory main page
│       └── business-name.md      # Individual listings
├── layouts/
│   └── directory/
│       ├── list.html             # Directory listing page
│       └── single.html           # Individual listing page
└── archetypes/
    └── directory.md              # Template for new listings
```

## � Quick Start

### Method 1: Data-Driven Directory (Recommended for bulk)

1. **Edit the data file** `data/directory_example.yml`
2. **Add your listings** following the template structure
3. **View at** `/directory/` on your site

### Method 2: Content-Driven Directory

1. **Create new listing:**
```bash
hugo new directory/my-business.md
```

2. **Edit the generated file** in `content/directory/`
3. **Fill in the business details**
4. **Save and preview**

## � Data Template Structure

### Complete Listing Fields

```yaml
listings:
  - id: "unique-id"                  # Required: Unique identifier
    name: "Business Name"             # Required: Display name
    category: "Category"              # Required: Main category
    subcategory: "Subcategory"        # Optional: Sub-category
    description: "Description"        # Required: Brief description
    
    address:
      street: "123 Main St"
      city: "City Name"
      state: "ST"
      zip: "12345"
      country: "USA"
    
    contact:
      phone: "+1 (555) 123-4567"
      email: "email@example.com"
      website: "https://example.com"
    
    hours:
      monday: "9:00 AM - 5:00 PM"
      tuesday: "9:00 AM - 5:00 PM"
      wednesday: "9:00 AM - 5:00 PM"
      thursday: "9:00 AM - 5:00 PM"
      friday: "9:00 AM - 5:00 PM"
      saturday: "10:00 AM - 2:00 PM"
      sunday: "Closed"
    
    social:
      facebook: "https://facebook.com/page"
      twitter: "https://twitter.com/handle"
      linkedin: "https://linkedin.com/company/name"
      instagram: "https://instagram.com/handle"
    
    features:                        # List of features/amenities
      - "Free Parking"
      - "WiFi Available"
      - "Wheelchair Accessible"
    
    tags:                            # For search/filtering
      - "restaurant"
      - "italian"
      - "family-friendly"
    
    images:
      logo: "/images/logo.jpg"
      featured: "/images/featured.jpg"
      gallery:
        - "/images/gallery-1.jpg"
        - "/images/gallery-2.jpg"
    
    ratings:
      average: 4.5                   # Average rating (0-5)
      count: 127                     # Number of reviews
    
    verified: true                   # Verified business badge
    featured: false                  # Featured listing
    date_added: "2024-01-15"
    last_updated: "2024-08-06"
```

## � Converting Spreadsheet to Directory

### Step 1: Prepare Your Spreadsheet

Create columns for:
- Business Name
- Category
- Description
- Phone
- Email
- Website
- Street Address
- City
- State
- ZIP

### Step 2: Export as CSV

Save your spreadsheet as CSV format.

### Step 3: Convert to YAML (Using Python Script)

```python
import csv
import yaml

# Read CSV
with open('businesses.csv', 'r') as file:
    reader = csv.DictReader(file)
    listings = []
    
    for i, row in enumerate(reader, 1):
        listing = {
            'id': f"business-{i:03d}",
            'name': row['Business Name'],
            'category': row['Category'],
            'description': row['Description'],
            'address': {
                'street': row['Street Address'],
                'city': row['City'],
                'state': row['State'],
                'zip': row['ZIP']
            },
            'contact': {
                'phone': row['Phone'],
                'email': row['Email'],
                'website': row['Website']
            },
            'verified': False,
            'featured': False
        }
        listings.append(listing)
    
    # Write YAML
    output = {'listings': listings}
    with open('data/directory.yml', 'w') as outfile:
        yaml.dump(output, outfile, default_flow_style=False)
```

### Step 4: Alternative - Create Markdown Files

```python
import csv
from datetime import datetime

with open('businesses.csv', 'r') as file:
    reader = csv.DictReader(file)
    
    for i, row in enumerate(reader, 1):
        filename = row['Business Name'].lower().replace(' ', '-')
        
        content = f'''---
title: "{row['Business Name']}"
date: {datetime.now().isoformat()}
type: "directory"

business:
  name: "{row['Business Name']}"
  category: "{row['Category']}"
  description: "{row['Description']}"

address:
  street: "{row['Street Address']}"
  city: "{row['City']}"
  state: "{row['State']}"
  zip: "{row['ZIP']}"

contact:
  phone: "{row['Phone']}"
  email: "{row['Email']}"
  website: "{row['Website']}"

verified: false
featured: false
---

## About {row['Business Name']}

{row['Description']}
'''
        
        with open(f'content/directory/{filename}.md', 'w') as f:
            f.write(content)
```

## � Customization

### Adding Custom Fields

1. **Update data template** in `data/directory_example.yml`
2. **Modify archetype** in `archetypes/directory.md`
3. **Update layouts** in `layouts/directory/single.html`

### Styling the Directory

Edit the `<style>` sections in:
- `layouts/directory/list.html` - For the listing page
- `layouts/directory/single.html` - For individual pages

### Categories

Add your categories to the filter dropdown in `layouts/directory/list.html`:

```html
<option value="your-category">Your Category</option>
```

## � Features

### Current Features
- Grid/list view of all listings
- Individual listing pages
- Category filtering
- Search functionality
- Sort by name/rating
- Verified badges
- Featured listings
- Ratings display
- Social media links
- Business hours
- Contact information
- Photo galleries
- SEO optimization with Schema.org

### Future Enhancements
- User reviews
- Map integration
- Advanced search filters
- Claim listing functionality
- Analytics tracking
- Email inquiries
- Booking integration

## � Mobile Optimization

The directory is fully responsive with:
- Touch-friendly interface
- Mobile-optimized cards
- Readable text sizes
- Accessible tap targets

## � Troubleshooting

### Listings Not Showing

1. Check file location: `data/directory_example.yml`
2. Verify YAML syntax (no tabs, proper indentation)
3. Clear Hugo cache: `hugo --gc`

### Images Not Loading

1. Place images in `static/images/directory/`
2. Reference as `/images/directory/image.jpg`
3. Check file extensions (case-sensitive)

### Search Not Working

- JavaScript must be enabled
- Check browser console for errors
- Verify data attributes in HTML

## � SEO Best Practices

1. **Unique descriptions** for each listing
2. **Local keywords** in content
3. **Complete address** information
4. **Schema.org markup** (automatically included)
5. **Regular updates** to listings

## � Deployment

After adding listings:

1. **Test locally:**
```bash
hugo server -D
```

2. **Build site:**
```bash
hugo --minify
```

3. **Push to GitHub:**
```bash
git add .
git commit -m "Add directory listings"
git push
```

4. **Netlify auto-deploys** your changes

## � Resources

- [Hugo Data Templates](https://gohugo.io/templates/data-templates/)
- [YAML Syntax](https://yaml.org/spec/1.2/spec.html)
- [Schema.org LocalBusiness](https://schema.org/LocalBusiness)

---

**Need Help?** The directory template is designed to be flexible. Start with a few listings and expand as needed!