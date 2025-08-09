#!/bin/bash
# Script to check CloudCannon build status

echo "================================================"
echo "CloudCannon Build Check"
echo "================================================"

# Test build locally first
echo ""
echo "Testing local Hugo build..."
if command -v hugo &> /dev/null; then
    hugo version
    hugo --gc --minify
    if [ $? -eq 0 ]; then
        echo "✅ Local build successful!"
    else
        echo "❌ Local build failed"
    fi
else
    echo "⚠️  Hugo not installed locally"
fi

echo ""
echo "================================================"
echo "To check CloudCannon build status:"
echo "================================================"
echo ""
echo "1. Using CloudCannon CLI:"
echo "   cloudcannon status"
echo ""
echo "2. Using CloudCannon Dashboard:"
echo "   https://app.cloudcannon.com"
echo "   → Select your site"
echo "   → Click 'Builds' tab"
echo ""
echo "3. Trigger new build:"
echo "   cloudcannon build"
echo ""
echo "================================================"