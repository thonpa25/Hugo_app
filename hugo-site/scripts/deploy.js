#!/usr/bin/env node

/**
 * Node.js deployment script for Netlify
 * Uses environment variables for security
 * Usage: node scripts/deploy.js
 */

const https = require('https');
const fs = require('fs');
const path = require('path');

// Colors for console output
const colors = {
  reset: '\x1b[0m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  cyan: '\x1b[36m',
  gray: '\x1b[90m'
};

// Load environment variables from .env file if it exists
function loadEnvFile() {
  const envPath = path.join(__dirname, '..', '.env');
  if (fs.existsSync(envPath)) {
    console.log(`${colors.gray}Loading environment variables from .env file...${colors.reset}`);
    const envContent = fs.readFileSync(envPath, 'utf8');
    envContent.split('\n').forEach(line => {
      // Skip comments and empty lines
      if (line && !line.startsWith('#')) {
        const [key, ...valueParts] = line.split('=');
        if (key && valueParts.length > 0) {
          process.env[key.trim()] = valueParts.join('=').trim();
        }
      }
    });
  }
}

// Trigger Netlify deployment
function triggerDeploy() {
  const webhookUrl = process.env.NETLIFY_BUILD_HOOK;
  
  if (!webhookUrl) {
    console.error(`${colors.red}ERROR: NETLIFY_BUILD_HOOK environment variable not set!${colors.reset}`);
    console.log(`\n${colors.yellow}Please set up your environment:`);
    console.log('1. Copy .env.example to .env');
    console.log('2. Add your Netlify build hook URL to .env file');
    console.log(`3. Or set NETLIFY_BUILD_HOOK environment variable${colors.reset}`);
    console.log(`\n${colors.gray}Example:`);
    console.log('  export NETLIFY_BUILD_HOOK="https://api.netlify.com/build_hooks/YOUR_HOOK_ID"');
    console.log(`  node scripts/deploy.js${colors.reset}`);
    process.exit(1);
  }

  // Parse webhook URL
  const urlParts = new URL(webhookUrl);
  
  const options = {
    hostname: urlParts.hostname,
    path: urlParts.pathname,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    }
  };

  console.log(`${colors.cyan}========================================`);
  console.log('  Netlify Deployment Script');
  console.log(`========================================${colors.reset}\n`);
  
  console.log(`${colors.yellow}Triggering Netlify deployment...${colors.reset}`);

  const req = https.request(options, (res) => {
    if (res.statusCode === 200) {
      console.log(`${colors.green}✅ Deployment triggered successfully!${colors.reset}\n`);
      
      if (process.env.NETLIFY_SITE_URL) {
        console.log(`${colors.cyan}Site URL: ${process.env.NETLIFY_SITE_URL}${colors.reset}`);
      }
      
      console.log(`${colors.cyan}Check deployment status at:`);
      console.log(`https://app.netlify.com/sites/YOUR-SITE-NAME/deploys${colors.reset}`);
    } else {
      console.log(`${colors.yellow}⚠️ Unexpected response: ${res.statusCode}${colors.reset}`);
    }
  });

  req.on('error', (error) => {
    console.error(`${colors.red}❌ Failed to trigger deployment!`);
    console.error(`Error: ${error.message}${colors.reset}`);
    process.exit(1);
  });

  req.end();
}

// Main execution
function main() {
  loadEnvFile();
  triggerDeploy();
}

main();