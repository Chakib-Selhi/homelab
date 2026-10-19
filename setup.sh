#!/usr/bin/env bash
# One-command setup: initializes git, installs the secret-scan hook, creates the
# GitHub repo under YOUR account, and pushes. You authenticate yourself.
#
# Prerequisites (one time):
#   brew install gh gitleaks
#   gh auth login            # sign in to your own GitHub account
#
# Usage:
#   bash setup.sh [repo-name] [public|private]
# Example:
#   bash setup.sh homelab public

set -euo pipefail

REPO_NAME="${1:-homelab}"
VISIBILITY="${2:-public}"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required."; exit 1
fi
if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is required: brew install gh"; exit 1
fi
if ! gh auth status >/dev/null 2>&1; then
  echo "You are not logged in to GitHub. Run: gh auth login"; exit 1
fi

if [ ! -d .git ]; then
  git init -b main
fi

# Install the pre-commit secret-scan hook
if [ -f hooks/pre-commit ]; then
  cp hooks/pre-commit .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
  echo "Installed pre-commit secret-scan hook."
fi

git add .
git commit -m "docs: initial homelab documentation" || echo "Nothing to commit."

# Create the repo on your account and push
gh repo create "$REPO_NAME" --"$VISIBILITY" --source=. --remote=origin --push

echo
echo "Done. Repository created and pushed."
echo "Next: open it on GitHub, then pin it to your profile."
gh repo view --web || true
