#!/bin/bash
# Setup script for CloudCannon deployment automation
# This script helps configure CloudCannon webhooks with GitHub

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}=========================================="
echo -e "  CloudCannon Deployment Setup"
echo -e "==========================================${NC}"
echo ""

echo -e "${YELLOW}Prerequisites:${NC}"
echo "1. GitHub repository connected to CloudCannon ✓"
echo "2. CloudCannon site created ✓"
echo "3. Admin access to both GitHub and CloudCannon"
echo ""

echo -e "${CYAN}Step 1: Get CloudCannon Build Hook${NC}"
echo "1. Log in to CloudCannon: https://app.cloudcannon.com"
echo "2. Select your site"
echo "3. Go to Settings → Builds → Build Hooks"
echo "4. Click 'Add Build Hook'"
echo "5. Name it: 'GitHub Auto-Deploy'"
echo "6. Copy the webhook URL"
echo ""

echo -e "${CYAN}Step 2: Add Webhook to GitHub${NC}"
echo "1. Go to: https://github.com/thonpa25/Hugo_app/settings/hooks"
echo "2. Click 'Add webhook'"
echo "3. Paste the CloudCannon webhook URL"
echo "4. Content type: application/json"
echo "5. Which events? Select 'Just the push event'"
echo "6. Make sure 'Active' is checked"
echo "7. Click 'Add webhook'"
echo ""

echo -e "${CYAN}Step 3: Configure CloudCannon Settings${NC}"
echo "In CloudCannon site settings, ensure:"
echo "- Source: hugo-site/"
echo "- Build command: hugo --gc --minify"
echo "- Output path: public"
echo "- Hugo version: 0.129.0"
echo ""

echo -e "${CYAN}Step 4: Test the Setup${NC}"
echo "Run this command to test:"
echo -e "${GREEN}git commit --allow-empty -m 'Test CloudCannon auto-deploy' && git push${NC}"
echo ""
echo "Then check CloudCannon dashboard for build status."
echo ""

echo -e "${GREEN}✅ Setup Instructions Complete!${NC}"
echo ""
echo -e "${YELLOW}Current Deployment Flow:${NC}"
echo "1. Push to GitHub → Triggers CloudCannon webhook"
echo "2. Edit in CloudCannon → Auto-commits to GitHub"
echo "3. Both trigger rebuilds automatically"
echo ""

echo -e "${CYAN}Useful Links:${NC}"
echo "- CloudCannon Dashboard: https://app.cloudcannon.com"
echo "- GitHub Webhooks: https://github.com/thonpa25/Hugo_app/settings/hooks"
echo "- CloudCannon Docs: https://cloudcannon.com/documentation/"
echo ""