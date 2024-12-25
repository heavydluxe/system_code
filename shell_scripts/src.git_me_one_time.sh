#!/bin/sh
# This script commits changed files in pwd to git & github.

# Get the current date and time in the desired format
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Start with backup processes
echo "  ____ ___ _____    ___  _   _   _   _ ____  "
echo " / ___|_ _|_   _|  / _ \| \ | | | | | |  _ \ "
echo "| |  _ | |  | |   | | | |  \| | | | | | |_) |"
echo "| |_| || |  | |   | |_| | |\  | | |_| |  __/ "
echo " \____|___| |_|    \___/|_| \_|  \___/|_|    "
echo ""
echo ""
sleep 2

# Git operations
echo "It's time to COMMIT all you GOTS in your GIT!!"
echo "Starting git operations..."
sleep 1

# Add pending files and commit locally
echo "Adding all trackable files for local git commit..."
git add -A
sleep 1
echo "Commiting files to local repo.  Enter commmit message now."
read -p ">> " commit_message
echo ""
git commit -m "$commit_message"
sleep 1

# Push last changes to github
echo ""
echo "Pushing changes to github repo in verbose mode..."
echo "" 
git push -u origin main
sleep 1
echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _' |/ _ \| '_ \ / _ \ | "
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo ""
echo "As James Brown - the famous coder that he was - once said..."
echo "Git up, git on up! It's all on the scene, from your coding machine!"


