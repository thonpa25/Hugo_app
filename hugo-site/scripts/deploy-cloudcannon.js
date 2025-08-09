#!/usr/bin/env node

/**
 * CloudCannon Deployment Script for Claude Code
 * Automates deployment to CloudCannon from your local environment
 */

const https = require('https');
const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');

// Colors for console output
const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  red: '\x1b[31m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  blue: '\x1b[34m',
  cyan: '\x1b[36m'
};

console.log(`${colors.cyan}${colors.bright}
╔══════════════════════════════════════════╗
║   CloudCannon Deployment via Claude Code  ║
╚══════════════════════════════════════════╝
${colors.reset}`);

// Load environment variables
function loadEnv() {
  const envPath = path.join(__dirname, '..', '.env');
  if (fs.existsSync(envPath)) {
    const envContent = fs.readFileSync(envPath, 'utf8');
    envContent.split('\n').forEach(line => {
      if (line && !line.startsWith('#')) {
        const [key, value] = line.split('=');
        if (key && value) {
          process.env[key.trim()] = value.trim();
        }
      }
    });
  }
}

// Git operations
function gitOperations() {
  return new Promise((resolve, reject) => {
    console.log(`${colors.yellow}📋 Checking Git status...${colors.reset}`);
    
    exec('git status --porcelain', (error, stdout) => {
      if (error) {
        reject(error);
        return;
      }
      
      if (stdout.trim()) {
        console.log(`${colors.yellow}📝 Uncommitted changes detected. Committing...${colors.reset}`);
        
        const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
        const commitMessage = `CloudCannon deployment via Claude Code - ${timestamp}`;
        
        exec(`git add -A && git commit -m "${commitMessage}"`, (error) => {
          if (error && !error.message.includes('nothing to commit')) {
            reject(error);
            return;
          }
          
          console.log(`${colors.green}✅ Changes committed${colors.reset}`);
          pushToGitHub(resolve, reject);
        });
      } else {
        console.log(`${colors.green}✅ No uncommitted changes${colors.reset}`);
        pushToGitHub(resolve, reject);
      }
    });
  });
}

function pushToGitHub(resolve, reject) {
  console.log(`${colors.yellow}🚀 Pushing to GitHub...${colors.reset}`);
  
  exec('git push origin main', (error, stdout, stderr) => {
    if (error) {
      if (stderr.includes('Everything up-to-date')) {
        console.log(`${colors.green}✅ Already up to date${colors.reset}`);
        resolve();
      } else {
        reject(error);
      }
      return;
    }
    
    console.log(`${colors.green}✅ Pushed to GitHub${colors.reset}`);
    resolve();
  });
}

// Trigger CloudCannon webhook
function triggerCloudCannon() {
  return new Promise((resolve, reject) => {
    const webhookUrl = process.env.CLOUDCANNON_BUILD_HOOK;
    
    if (!webhookUrl) {
      console.log(`${colors.yellow}ℹ️  No CloudCannon webhook configured.${colors.reset}`);
      console.log(`${colors.cyan}CloudCannon will auto-sync from GitHub push.${colors.reset}`);
      resolve();
      return;
    }
    
    console.log(`${colors.yellow}🔔 Triggering CloudCannon build...${colors.reset}`);
    
    const url = new URL(webhookUrl);
    const options = {
      hostname: url.hostname,
      path: url.pathname,
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      }
    };
    
    const req = https.request(options, (res) => {
      if (res.statusCode >= 200 && res.statusCode < 300) {
        console.log(`${colors.green}✅ CloudCannon build triggered${colors.reset}`);
        resolve();
      } else {
        console.log(`${colors.yellow}⚠️  CloudCannon returned status ${res.statusCode}${colors.reset}`);
        resolve(); // Don't fail, CloudCannon might still sync
      }
    });
    
    req.on('error', (error) => {
      console.log(`${colors.yellow}⚠️  Webhook error: ${error.message}${colors.reset}`);
      resolve(); // Don't fail, CloudCannon might still sync
    });
    
    req.write(JSON.stringify({
      branch: 'main',
      triggered_by: 'Claude Code',
      timestamp: new Date().toISOString()
    }));
    
    req.end();
  });
}

// Main deployment flow
async function deploy() {
  try {
    loadEnv();
    
    console.log(`${colors.blue}Starting CloudCannon deployment process...${colors.reset}\n`);
    
    // Step 1: Git operations
    await gitOperations();
    
    // Step 2: Trigger CloudCannon (optional)
    await triggerCloudCannon();
    
    // Success summary
    console.log(`\n${colors.green}${colors.bright}═══════════════════════════════════════════`);
    console.log(`✨ Deployment Complete!`);
    console.log(`═══════════════════════════════════════════${colors.reset}\n`);
    
    console.log(`${colors.cyan}📊 What happens next:${colors.reset}`);
    console.log(`   1. GitHub has your latest changes`);
    console.log(`   2. CloudCannon is syncing automatically`);
    console.log(`   3. Site will be updated in 1-3 minutes`);
    console.log(`   4. Check CloudCannon dashboard for status\n`);
    
    console.log(`${colors.blue}🔗 Links:${colors.reset}`);
    console.log(`   CloudCannon: https://app.cloudcannon.com`);
    console.log(`   GitHub: https://github.com/thonpa25/Hugo_app\n`);
    
  } catch (error) {
    console.error(`${colors.red}❌ Deployment failed: ${error.message}${colors.reset}`);
    process.exit(1);
  }
}

// Run deployment
deploy();