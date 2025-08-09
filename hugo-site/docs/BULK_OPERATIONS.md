# Bulk Operations Guide: Managing Large-Scale Content

This guide covers managing hundreds or thousands of content items efficiently using your Hugo site's built-in bulk operations system.

## What You'll Accomplish

By the end of this guide, you'll be able to:
- Import hundreds of listings from CSV/Excel files
- Process thousands of directory entries automatically  
- Monitor bulk operations with real-time progress tracking
- Update metadata across hundreds of files at once
- Set up automated content workflows
- Handle enterprise-scale content management

## When You Need Bulk Operations

**Perfect for:**
- Business directory sites (restaurants, services, healthcare)
- Product catalogs with hundreds of items
- Member directories or staff listings  
- Event listings and calendars
- Real estate listings
- Job boards
- Moving content from other systems

**Signs you need this guide:**
- You have 50+ items to add
- Data is already in spreadsheets
- Content updates need to happen regularly
- Multiple people manage content
- You're migrating from another system

## System Overview

Your Hugo site includes a comprehensive bulk operations system located in the `scripts/` folder:

```
scripts/
├── csv_to_markdown.py      # Convert CSV to Hugo pages
├── batch_processor.py      # Advanced batch operations
├── bulk_operations.py      # Simplified bulk tools  
├── automated_import.py     # Automated workflows
├── progress_monitor.py     # Real-time monitoring
└── config/                 # Configuration files
```

## Prerequisites

### Required Software

1. **Python 3.7+** (Download from python.org)
2. **Hugo** (See [Setup Guide](SETUP_GUIDE.md))
3. **Your site files** (cloned locally)

### Install Dependencies

```bash
# Navigate to your site folder
cd your-hugo-site

# Install required packages
pip install -r scripts/requirements.txt
```

**Screenshot Placeholder**: Installing Python dependencies

## Method 1: Simple CSV Import (Recommended)

### Step 1: Prepare Your Data

1. **Create CSV File**
   - Use Excel, Google Sheets, or any spreadsheet software
   - Save as `.csv` format
   - Place in the `import/` folder

2. **Required Columns**
   - `name` or `title` - Main heading
   - `description` - Content description
   - `category` - Content category

3. **Optional Columns**
   - `address`, `phone`, `email`, `website`
   - `tags` (comma-separated)
   - `featured_image`
   - `rating`, `price`, `hours`

4. **Example CSV Structure**
   ```csv
   name,description,category,address,phone,website,tags
   "Joe's Pizza","Best pizza in town","restaurant","123 Main St","555-1234","joes-pizza.com","italian,pizza,family"
   "Smith Dental","Family dentistry","healthcare","456 Oak Ave","555-5678","smithdental.com","dentist,family,insurance"
   ```

**Screenshot Placeholder**: Excel/Google Sheets CSV preparation

### Step 2: Run Import

1. **Basic Import Command**
   ```bash
   python scripts/csv_to_markdown.py import/your-file.csv content/directory
   ```

2. **With Configuration**
   ```bash
   python scripts/csv_to_markdown.py import/restaurants.csv content/directory --config scripts/config/directory_config.yaml
   ```

3. **Monitor Progress**
   - Progress bar shows completion status
   - Error messages display if issues occur
   - Summary report shows results

**Screenshot Placeholder**: CSV import running with progress bar

### Step 3: Review Results

1. **Check Generated Files**
   - Look in `content/directory/` folder
   - Each CSV row becomes a `.md` file
   - Files named based on content (auto-slugified)

2. **Test Your Site**
   ```bash
   hugo server
   ```
   - Go to http://localhost:1313
   - Navigate to directory/listing pages
   - Verify content displays properly

3. **Make Adjustments**
   - Edit individual `.md` files if needed
   - Re-run import with different settings
   - Use bulk update commands for changes

## Method 2: Advanced Batch Processing

### Step 1: Configure Batch Processor

Edit `scripts/config/batch_processor_config.yaml`:

```yaml
# Performance settings
max_workers: 8              # Number of parallel processes
batch_size: 500             # Items processed together
timeout: 300                # Seconds before timeout
retry_attempts: 3           # Retry failed items

# Safety settings  
backup_enabled: true        # Create backups before processing
validation_enabled: true    # Validate content before import
dry_run_first: false       # Test without making changes

# Logging
log_level: INFO
log_file: "batch_processor.log"

# Content settings
default_author: "Site Admin"
default_draft: false
auto_generate_tags: true
```

### Step 2: Run Batch Operations

1. **CSV Import with Batch Processing**
   ```bash
   python scripts/batch_processor.py csv-import import/large-dataset.csv --output-dir content/directory
   ```

2. **Multiple File Import**
   ```bash
   python scripts/batch_processor.py csv-import import/*.csv --output-dir content/directory
   ```

3. **Monitor Job Progress**
   ```bash
   # Check specific job
   python scripts/batch_processor.py status JOB_ID

   # List all jobs
   python scripts/batch_processor.py list

   # View job details
   python scripts/batch_processor.py details JOB_ID
   ```

**Screenshot Placeholder**: Batch processor status dashboard

### Step 3: Bulk Update Operations

1. **Update Front Matter Across Files**
   ```bash
   # Add featured flag to all restaurant listings
   python scripts/batch_processor.py bulk-update content/directory/restaurants/ --set featured=true

   # Update category for specific files
   python scripts/batch_processor.py bulk-update content/directory/pizza-*.md --set category=italian-food
   ```

2. **Bulk Rename Files**
   ```bash
   # Rename files with consistent pattern
   python scripts/bulk_operations.py rename "directory/**/*.md" "listing-{index}.md"
   ```

3. **Delete Files Matching Pattern**
   ```bash
   # Remove old/outdated files (with confirmation)
   python scripts/bulk_operations.py delete "directory/old-*.md"
   ```

## Method 3: Real-Time Monitoring

### Progress Monitor Dashboard

1. **Start Web Dashboard**
   ```bash
   python scripts/progress_monitor.py --port 5000
   ```

2. **Access Dashboard**
   - Open browser to http://localhost:5000
   - Real-time metrics and charts
   - Job status tracking
   - System performance monitoring

3. **Features Available**
   - **Live Progress**: See operations in real-time
   - **Error Tracking**: Monitor and resolve issues
   - **Performance Metrics**: System resource usage
   - **Job History**: Complete operation logs

**Screenshot Placeholder**: Progress monitor web dashboard

### Console Monitoring

```bash
# Monitor without web interface
python scripts/progress_monitor.py --no-dashboard

# Monitor specific operation
python scripts/progress_monitor.py --job-id JOB_ID
```

## Method 4: Automated Import System

### Setup Automated Processing

1. **Configure Automation** (`scripts/config/automated_import_config.yaml`)
   ```yaml
   # Watch settings
   watch_directory: "import/"
   processed_directory: "import/processed/"
   failed_directory: "import/failed/"
   
   # Processing settings
   auto_process: true
   process_interval: 300    # Check every 5 minutes
   batch_size: 1000
   
   # Notifications
   email_notifications: true
   smtp_server: "your-smtp-server.com"
   email_from: "system@yourdomain.com"
   email_to: ["admin@yourdomain.com"]
   
   # Slack notifications (optional)
   slack_webhook_url: "https://hooks.slack.com/your/webhook/url"
   ```

2. **Start Automation Daemon**
   ```bash
   # Foreground mode (for testing)
   python scripts/automated_import.py start --foreground
   
   # Background mode (production)
   python scripts/automated_import.py start
   ```

3. **Check Status**
   ```bash
   python scripts/automated_import.py status
   ```

### Using Automated System

1. **Drop Files for Processing**
   - Place CSV files in `import/` folder
   - System automatically detects and processes
   - Processed files moved to `import/processed/`
   - Failed files moved to `import/failed/`

2. **Monitor Email Notifications**
   - Success notifications include summary stats
   - Error notifications include failure details
   - Regular status reports (configurable frequency)

3. **Manual Processing**
   ```bash
   # Process specific file immediately
   python scripts/automated_import.py import import/urgent-file.csv
   ```

## Advanced Features

### Custom Field Mappings

1. **Create Mapping File** (`scripts/config/custom_mapping.yaml`)
   ```yaml
   field_mappings:
     business_name: title
     company_description: description  
     business_type: category
     contact_phone: phone
     contact_email: email
     website_url: website
     street_address: address
     business_hours: hours
     year_founded: established
     
   # Default values for missing fields
   defaults:
     draft: false
     author: "Directory Admin"
     layout: "directory-single"
   
   # Content transformation
   transformations:
     phone: "format_phone"      # Apply phone formatting
     website: "ensure_https"    # Add https:// if missing
     tags: "split_and_clean"    # Split comma-separated tags
   ```

2. **Use Custom Mapping**
   ```bash
   python scripts/csv_to_markdown.py import/data.csv content/directory --mapping scripts/config/custom_mapping.yaml
   ```

### Large Dataset Processing

For datasets with 1000+ entries:

1. **Optimize Settings**
   ```yaml
   # In batch_processor_config.yaml
   max_workers: 16          # Use more CPU cores
   batch_size: 1000         # Larger batches
   memory_limit: "4GB"      # Set memory limits
   concurrent_files: 50     # Process multiple files
   ```

2. **Use Chunked Processing**
   ```bash
   # Process in chunks to avoid memory issues
   python scripts/csv_to_markdown.py large-file.csv content/directory --chunk-size 1000
   ```

3. **Monitor System Resources**
   ```bash
   # Run monitoring during large operations
   python scripts/progress_monitor.py --watch-resources
   ```

### Content Validation

1. **Enable Validation**
   ```yaml
   # In directory_config.yaml
   validation:
     enabled: true
     required_fields: ["title", "description", "category"]
     url_validation: true
     image_validation: true
     duplicate_detection: true
   ```

2. **Validation Reports**
   - Generated automatically during import
   - Saved to `validation_report.html`
   - Shows errors, warnings, statistics

3. **Fix Common Issues**
   ```bash
   # Automatically fix common validation errors
   python scripts/bulk_operations.py fix-validation content/directory/
   ```

## Sample Data and Testing

### Use Provided Sample Data

Your site includes sample datasets:

```bash
# Import restaurant sample (100+ entries)
python scripts/csv_to_markdown.py import/sample_restaurants.csv content/directory

# Import services sample
python scripts/csv_to_markdown.py import/sample_services.csv content/directory

# Import healthcare sample  
python scripts/csv_to_markdown.py import/sample_healthcare.csv content/directory
```

### Generate Large Test Datasets

```bash
# Create 5000 sample entries for testing
python scripts/generate_large_sample.py --count 5000 --output import/test_large.csv

# Import the large dataset
python scripts/batch_processor.py csv-import import/test_large.csv --output-dir content/directory
```

## Integration with Hugo Features

### Search and Filtering

After bulk import, your directory will automatically support:

1. **Real-time Search**
   - JavaScript-based fuzzy search
   - Works with thousands of entries
   - Instant results as user types

2. **Category Filtering**  
   - Automatic category extraction
   - Filter by multiple categories
   - Breadcrumb navigation

3. **Location Filtering**
   - Geographic filtering
   - City, state, country hierarchy
   - Map integration support

### SEO Optimization

Bulk operations automatically handle:

1. **URL Generation**
   - SEO-friendly URLs from titles
   - Duplicate URL prevention
   - Custom URL patterns

2. **Meta Data**
   - Auto-generated descriptions
   - Keywords from tags
   - Structured data markup

3. **Image Optimization**
   - Automatic alt text generation
   - Image resizing and compression
   - Responsive image support

## Troubleshooting Bulk Operations

### Common Issues and Solutions

1. **Memory Errors**
   ```bash
   # Reduce batch size
   python scripts/csv_to_markdown.py file.csv output/ --batch-size 100
   
   # Use streaming mode
   python scripts/csv_to_markdown.py file.csv output/ --stream
   ```

2. **Encoding Issues**
   ```bash
   # Specify encoding for international characters
   python scripts/csv_to_markdown.py file.csv output/ --encoding utf-8
   ```

3. **Slow Processing**
   ```bash
   # Increase parallel workers
   python scripts/batch_processor.py csv-import file.csv --workers 16
   
   # Skip validation for speed
   python scripts/csv_to_markdown.py file.csv output/ --no-validation
   ```

4. **Hugo Build Failures**
   ```bash
   # Validate content before processing
   python scripts/bulk_operations.py validate content/directory/
   
   # Fix common Hugo issues
   python scripts/bulk_operations.py fix-hugo-errors content/directory/
   ```

### Error Recovery

1. **Backup and Restore**
   ```bash
   # Create backup before bulk operation
   python scripts/bulk_operations.py backup content/directory/
   
   # Restore from backup if needed
   python scripts/bulk_operations.py restore backup-20231201-143022/
   ```

2. **Partial Processing Recovery**
   ```bash
   # Resume failed batch job
   python scripts/batch_processor.py resume JOB_ID
   
   # Process only failed items
   python scripts/batch_processor.py retry-failed JOB_ID
   ```

3. **Data Cleanup**
   ```bash
   # Remove invalid entries
   python scripts/bulk_operations.py cleanup content/directory/ --remove-invalid
   
   # Fix broken front matter
   python scripts/bulk_operations.py fix-frontmatter content/directory/
   ```

## Performance Optimization

### For Large Sites (1000+ Pages)

1. **Hugo Build Optimization**
   ```bash
   # Build with parallel processing
   hugo --gc --minify --enableGitInfo=false
   
   # Skip unnecessary features during development
   hugo server --disableFastRender --noHTTPCache
   ```

2. **Content Organization**
   - Use subdirectories for categories
   - Implement pagination for large lists
   - Use Hugo's page resources for images

3. **Database Integration**
   - Consider headless CMS for very large datasets
   - Use external search services (Algolia, etc.)
   - Implement caching strategies

### Monitoring Performance

```bash
# Monitor build times during bulk operations
time hugo

# Profile memory usage
python scripts/progress_monitor.py --profile-memory

# Check site performance
hugo server --debug
```

## Best Practices

### Data Preparation

1. **Clean Your Data First**
   - Remove duplicate entries
   - Standardize formatting
   - Validate required fields

2. **Backup Everything**
   - Backup before bulk operations
   - Version control your changes
   - Test with small samples first

3. **Gradual Processing**
   - Start with 10-50 items
   - Test and refine process
   - Scale up gradually

### Content Management

1. **Consistent Naming**
   - Use consistent file naming conventions
   - Standardize category names
   - Clean up tags and metadata

2. **Quality Control**
   - Review generated content
   - Check for formatting issues
   - Validate all links and images

3. **Regular Maintenance**
   - Remove outdated entries
   - Update categories and tags
   - Monitor site performance

## Integration Examples

### E-commerce Product Import

```bash
# Import product catalog from Shopify export
python scripts/csv_to_markdown.py shopify_products.csv content/products --mapping scripts/config/shopify_mapping.yaml

# Add e-commerce specific fields
python scripts/bulk_operations.py update-frontmatter "content/products/*.md" '{"layout": "product", "type": "products"}'
```

### Event Listings Import

```bash  
# Import events from Eventbrite
python scripts/csv_to_markdown.py eventbrite_events.csv content/events

# Set up automatic expiration for past events
python scripts/automated_import.py setup-expiration content/events/ --expire-after-date
```

### Staff Directory Import

```bash
# Import employee data from HR system
python scripts/csv_to_markdown.py employees.csv content/team --mapping scripts/config/staff_mapping.yaml

# Add staff-specific layouts
python scripts/bulk_operations.py update-frontmatter "content/team/*.md" '{"layout": "staff-member", "type": "team"}'
```

---

**Success!** � You now have complete control over bulk content operations for your Hugo site. You can efficiently manage thousands of entries with automated workflows.

**Next Steps:**
- Start with small test imports to learn the system
- Set up automated workflows for regular content updates  
- Integrate with your existing content management processes
- Scale up to handle enterprise-level content volumes

**For ongoing content management**, combine this with [CloudCannon Editing](CLOUDCANNON_EDITING.md) for the perfect hybrid workflow.