#!/bin/sh

# If a command fails then the deploy stops
set -e

# Change to published book repo
printf "\033[0;32mMove into to published repo...\033[0m\n"
cd published

# Add changes to git.
printf "\033[0;32mStaging changes...\033[0m\n"
git add .

# Commit changes.
msg="rebuilding site $(date)"
git commit -m "$msg"

# Push source and build repos.
printf "\033[0;32mPushing to GitHub...\033[0m\n"
git push

# Return back to source build repo
printf "\033[0;32mSwitch back to source build repo...\033[0m\n"
cd ../