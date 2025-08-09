#!/bin/bash
# Comprehensive Netlify deployment diagnostics script
# Usage: ./scripts/diagnose.sh

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}=========================================="
echo -e "  Netlify Deployment Diagnostics"
echo -e "==========================================${NC}"
echo ""

# Check Git configuration
echo -e "${YELLOW}1. Checking Git Configuration...${NC}"
echo -n "   Repository remote: "
git remote get-url origin 2>/dev/null || echo "Not configured"
echo -n "   Current branch: "
git branch --show-current
echo -n "   Latest commit: "
git log -1 --oneline

echo ""

# Check submodules
echo -e "${YELLOW}2. Checking Git Submodules...${NC}"
if [ -f "../.gitmodules" ]; then
    echo -e "   ${GREEN}✓${NC} .gitmodules found at repository root"
    echo "   Submodule status:"
    (cd .. && git submodule status) | sed 's/^/   /'
else
    echo -e "   ${RED}✗${NC} .gitmodules not found at repository root"
fi

if [ -d "themes/bigspring/.git" ]; then
    echo -e "   ${GREEN}✓${NC} Bigspring theme is a proper submodule"
else
    echo -e "   ${RED}✗${NC} Bigspring theme is not a submodule"
fi

echo ""

# Check Netlify configuration
echo -e "${YELLOW}3. Checking Netlify Configuration...${NC}"
if [ -f "../netlify.toml" ]; then
    echo -e "   ${GREEN}✓${NC} Root netlify.toml found"
    echo -n "   Base directory: "
    grep "base =" ../netlify.toml | head -1 | cut -d'"' -f2
    echo -n "   Build command: "
    grep "command =" ../netlify.toml | head -1 | cut -d'"' -f2
    echo -n "   Publish directory: "
    grep "publish =" ../netlify.toml | head -1 | cut -d'"' -f2
    echo -n "   Hugo version: "
    grep "HUGO_VERSION =" ../netlify.toml | cut -d'"' -f2
else
    echo -e "   ${RED}✗${NC} Root netlify.toml not found"
fi

echo ""

# Check Hugo configuration
echo -e "${YELLOW}4. Checking Hugo Configuration...${NC}"
if [ -f "hugo.toml" ]; then
    echo -e "   ${GREEN}✓${NC} hugo.toml found"
    echo -n "   Base URL: "
    grep "^baseURL" hugo.toml | cut -d'=' -f2 | tr -d ' "'
    echo -n "   Theme: "
    grep "^theme" hugo.toml | cut -d'=' -f2 | tr -d ' "'
else
    echo -e "   ${RED}✗${NC} hugo.toml not found"
fi

echo ""

# Check directory structure
echo -e "${YELLOW}5. Checking Directory Structure...${NC}"
REQUIRED_DIRS=("content" "layouts" "static" "themes" "themes/bigspring")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo -e "   ${GREEN}✓${NC} $dir/ exists"
    else
        echo -e "   ${RED}✗${NC} $dir/ missing"
    fi
done

echo ""

# Check for common issues
echo -e "${YELLOW}6. Checking for Common Issues...${NC}"

# Check for uncommitted changes
if git diff-index --quiet HEAD --; then
    echo -e "   ${GREEN}✓${NC} No uncommitted changes"
else
    echo -e "   ${YELLOW}⚠${NC} Uncommitted changes present"
    git status --short | head -5 | sed 's/^/      /'
fi

# Check if public directory exists
if [ -d "public" ]; then
    echo -e "   ${YELLOW}⚠${NC} public/ directory exists locally (will be created by Netlify)"
else
    echo -e "   ${GREEN}✓${NC} public/ directory not present (good)"
fi

# Check node_modules
if [ -d "node_modules" ]; then
    echo -e "   ${GREEN}✓${NC} node_modules/ exists locally"
else
    echo -e "   ${YELLOW}ⓘ${NC} node_modules/ not present (will be installed by Netlify)"
fi

echo ""

# Test Hugo build locally
echo -e "${YELLOW}7. Testing Hugo Build Locally...${NC}"
if command -v hugo &> /dev/null; then
    echo "   Running: hugo --gc --minify --destination test-public"
    if hugo --gc --minify --destination test-public &> /dev/null; then
        echo -e "   ${GREEN}✓${NC} Hugo build successful"
        file_count=$(find test-public -type f | wc -l)
        echo "   Generated $file_count files"
        rm -rf test-public
    else
        echo -e "   ${RED}✗${NC} Hugo build failed"
        hugo --gc --minify --destination test-public 2>&1 | head -10 | sed 's/^/      /'
        rm -rf test-public
    fi
else
    echo -e "   ${YELLOW}ⓘ${NC} Hugo not installed locally (skipping test)"
fi

echo ""

# Check environment variables
echo -e "${YELLOW}8. Checking Environment Variables...${NC}"
if [ -f ".env" ]; then
    echo -e "   ${GREEN}✓${NC} .env file exists"
    if grep -q "NETLIFY_BUILD_HOOK=" .env; then
        echo -e "   ${GREEN}✓${NC} NETLIFY_BUILD_HOOK configured in .env"
    else
        echo -e "   ${YELLOW}⚠${NC} NETLIFY_BUILD_HOOK not found in .env"
    fi
else
    echo -e "   ${YELLOW}ⓘ${NC} .env file not found (using .env.example as template)"
fi

echo ""

# Summary
echo -e "${CYAN}=========================================="
echo -e "  Diagnostics Summary"
echo -e "==========================================${NC}"

# Count issues
CRITICAL=0
WARNINGS=0

# Check critical items
[ ! -f "../.gitmodules" ] && ((CRITICAL++))
[ ! -f "../netlify.toml" ] && ((CRITICAL++))
[ ! -f "hugo.toml" ] && ((CRITICAL++))
[ ! -d "themes/bigspring" ] && ((CRITICAL++))

if [ $CRITICAL -eq 0 ]; then
    echo -e "${GREEN}✅ All critical checks passed!${NC}"
    echo "Your Netlify deployment should work correctly."
else
    echo -e "${RED}❌ $CRITICAL critical issue(s) found${NC}"
    echo "Please fix the issues above before deploying."
fi

echo ""
echo -e "${CYAN}Next Steps:${NC}"
echo "1. Check your Netlify dashboard for build status"
echo "2. Review build logs if deployment fails"
echo "3. Run 'npm run deploy:manual' to trigger manual deployment"
echo ""