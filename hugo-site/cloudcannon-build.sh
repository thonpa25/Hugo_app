#!/bin/bash
# CloudCannon Build Script - Universal Theme Compatibility
# This script ensures Hugo builds work on CloudCannon regardless of sync status

set -e  # Exit on error

echo "=== CloudCannon Build Script Starting ==="
echo "Working directory: $(pwd)"
echo "Hugo version: $(hugo version)"

# Diagnostic information
echo "=== Environment Check ==="
echo "HUGO_THEME: ${HUGO_THEME:-not set}"
echo "HUGO_ENV: ${HUGO_ENV:-not set}"
echo "HUGO_VERSION: ${HUGO_VERSION:-not set}"

# Check themes directory
echo "=== Theme Directory Check ==="
if [ -d "themes" ]; then
    echo "Themes directory exists:"
    ls -la themes/
    
    # Ensure both theme names are available
    if [ -d "themes/bigspring" ] && [ ! -d "themes/bigspring-light" ]; then
        echo "Creating bigspring-light compatibility symlink..."
        ln -sf bigspring themes/bigspring-light
    fi
    
    if [ -d "themes/bigspring-light" ] && [ ! -d "themes/bigspring" ]; then
        echo "Creating bigspring compatibility symlink..."
        ln -sf bigspring-light themes/bigspring
    fi
else
    echo "ERROR: themes directory not found!"
    exit 1
fi

# Check for Hugo config files
echo "=== Configuration Check ==="
for config in hugo.yaml hugo.yml hugo.toml hugo-cloudcannon.yaml; do
    if [ -f "$config" ]; then
        echo "Found config: $config"
        CONFIG_FILE="$config"
    fi
done

if [ -z "$CONFIG_FILE" ]; then
    echo "ERROR: No Hugo configuration file found!"
    exit 1
fi

echo "Using configuration: $CONFIG_FILE"

# Build the site
echo "=== Building Hugo Site ==="
hugo --gc --minify --config "$CONFIG_FILE" --verbose

echo "=== Build Complete ==="
echo "Output directory contents:"
ls -la public/ | head -10

echo "=== CloudCannon Build Script Finished Successfully ==="