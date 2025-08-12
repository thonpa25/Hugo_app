# Setting Up GitHub Secrets

## Important: Add these secrets to your GitHub repository before making it public

### Steps to Add Secrets:

1. Go to your repository on GitHub: https://github.com/thonpa25/Hugo_app
2. Click on **Settings** (in the repository, not your profile)
3. In the left sidebar, click **Secrets and variables** → **Actions**
4. Click **New repository secret**

### Required Secrets:

#### 1. NETLIFY_BUILD_HOOK
- **Name**: `NETLIFY_BUILD_HOOK`
- **Value**: `https://api.netlify.com/build_hooks/6896c1f110673fda631dae2d`
- **Description**: Triggers Netlify builds when needed

#### 2. CLOUDCANNON_API_KEY (Optional)
- **Name**: `CLOUDCANNON_API_KEY`
- **Value**: Your CloudCannon API key (if you have one)
- **Description**: For CloudCannon API operations

### After Adding Secrets:

1. Delete the `.env` file from your local repository:
   ```bash
   rm hugo-site/.env
   ```

2. The GitHub Actions workflow will automatically use these secrets
3. Your sensitive data will be secure even in a public repository

### Security Notes:

- Never commit `.env` files with real values
- Always use GitHub Secrets for sensitive data in public repos
- Rotate your secrets periodically for better security
- If a secret is accidentally exposed, regenerate it immediately

### Testing:

After setting up secrets, test by:
1. Pushing a commit to trigger GitHub Actions
2. Checking the Actions tab to ensure builds work with secrets
3. Verifying Netlify deployments if configured