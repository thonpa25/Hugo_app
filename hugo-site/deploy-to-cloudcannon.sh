#!/bin/bash
# CloudCannon Deployment Script for Mac/Linux

echo ""
echo "===================================="
echo "  CloudCannon Deployment"
echo "===================================="
echo ""

cd "$(dirname "$0")"

echo "Deploying to CloudCannon..."
node scripts/deploy-cloudcannon.js