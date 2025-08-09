#!/bin/bash
# Bash script for Mac/Linux users to trigger Netlify deployment
# Usage: ./scripts/deploy.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
NC='\033[0m' # No Color

echo -e "${CYAN}========================================"
echo -e "  Netlify Deployment Script"
echo -e "========================================${NC}"
echo ""

# Get script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ENV_FILE="$SCRIPT_DIR/../.env"

# Load environment variables from .env file if it exists
if [ -f "$ENV_FILE" ]; then
    echo -e "${GRAY}Loading environment variables from .env file...${NC}"
    # Export variables from .env file, ignoring comments and empty lines
    export $(grep -v '^#' "$ENV_FILE" | grep -v '^$' | xargs)
fi

# Get webhook URL from environment variable
WEBHOOK_URL="${NETLIFY_BUILD_HOOK}"

# Check if webhook URL is configured
if [ -z "$WEBHOOK_URL" ]; then
    echo -e "${RED}ERROR: NETLIFY_BUILD_HOOK environment variable not set!${NC}"
    echo ""
    echo -e "${YELLOW}Please set up your environment:"
    echo -e "1. Copy .env.example to .env"
    echo -e "2. Add your Netlify build hook URL to .env file"
    echo -e "3. Or set NETLIFY_BUILD_HOOK environment variable${NC}"
    echo ""
    echo -e "${GRAY}Example:"
    echo -e '  export NETLIFY_BUILD_HOOK="https://api.netlify.com/build_hooks/YOUR_HOOK_ID"'
    echo -e "  ./scripts/deploy.sh${NC}"
    exit 1
fi

# Parse arguments
ENVIRONMENT=${1:-production}
MESSAGE=${2:-"Manual deployment triggered from local machine"}

echo -e "${GREEN}Environment: $ENVIRONMENT"
echo -e "Message: $MESSAGE${NC}"
echo ""

# Trigger deployment
echo -e "${YELLOW}Triggering Netlify deployment...${NC}"

response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$WEBHOOK_URL")

if [ "$response" -eq 200 ]; then
    echo -e "${GREEN}✅ Deployment triggered successfully!${NC}"
    echo ""
    
    # Display site URL if available
    if [ ! -z "$NETLIFY_SITE_URL" ]; then
        echo -e "${CYAN}Site URL: $NETLIFY_SITE_URL${NC}"
    fi
    
    echo -e "${CYAN}Check deployment status at:"
    echo -e "https://app.netlify.com/sites/YOUR-SITE-NAME/deploys${NC}"
else
    echo -e "${RED}❌ Failed to trigger deployment!"
    echo -e "HTTP Status Code: $response${NC}"
    exit 1
fi

echo ""
echo -e "${CYAN}========================================${NC}"