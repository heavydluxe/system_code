#!/bin/sh
# This script pushes src.gitignore changes and the git_me_one_time.sh and 
# backup_config.sh to the folders where they do work.
echo "                          _       _       "
echo " _ __   ___  _ __  _   _| | __ _| |_ ___  "
echo "| '_ \ / _ \| '_ \| | | | |/ _' | __/ _ \ "
echo "| |_) | (_) | |_) | |_| | | (_| | ||  __/ "
echo "| .__/ \___/| .__/ \__,_|_|\__,_|\__\___| "
echo "|_|         |_|                           "
echo "Pooshing working files to their working locations"
sleep 1 

## Populate gitignore
echo ">>> Pushing gitignore to each repository (from src.gitignore)"
sleep 1
echo "... to ~/sbemode/code ..."
cp src.gitignore ~/sbemode/code/.gitignore

sleep 1
echo "... to ~/sbemode/orgmode ..."
cp src.gitignore ~/sbemode/orgmode/.gitignore

sleep 1
echo "... to ~/sbemode/work_code ..."
cp src.gitignore ~/sbemode/work_code/.gitignore
sleep 1
echo ""

## Populate git_me_one_time.sh
echo ">>> Pushing git_me_one_time.sh to each repository (from src.git_me_one_time.sh)"
sleep 1
echo "... to ~/sbemode/code ..."
cp src.git_me_one_time.sh ~/sbemode/code/git_me_one_time.sh

sleep 1
echo "... to ~/sbemode/orgmode ..."
cp src.git_me_one_time.sh ~/sbemode/orgmode/git_me_one_time.sh

sleep 1
echo "... to ~/sbemode/work_code ..."
cp src.git_me_one_time.sh ~/sbemode/work_code/git_me_one_time.sh
sleep 1
echo ""

## Populate backup shell script to top-level
echo ">>> Finally, pushing backup_configurations to ~/sbemode (from src.backup_configurations.sh)"
sleep 1
echo "... to ~/sbemode ..."
cp src.backup_configurations.sh ~/sbemode/backup_configurations.sh
sleep 1

## End 
echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _' |/ _ \| '_ \ / _ \ | "
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo ""
echo "All useful files have been populated! Goodbye."
