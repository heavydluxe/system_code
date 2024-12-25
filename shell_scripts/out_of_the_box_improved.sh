#!/bin/sh

# Set hostname and ComputerName
## Prompt the user for the new hostname
read -p "Enter NEW Hostname for this device: " NEW_HOSTNAME
sudo scutil --set HostName "$NEW_HOSTNAME"
sudo scutil --set ComputerName "$NEW_HOSTNAME"
sudo scutil --set LocalHostName "$NEW_HOSTNAME"
echo "Hostname has been changed to '$NEW_HOSTNAME'"

## Input sudo password up front and keep it alive until script ends
echo "Input sudo password for this script to do root things."
sudo -v
while true; do sudo -n true; sleep 15; kill -0 "$$" || exit; done 2>/dev/null &

# Configure initial git global variables and get repos
echo "Configuring git..."
git config --global user.name "Brian Dellinger"
git config --global user.email "bdellinger@gmail.com"
git config --global init.defaultBranch main

## Setup Personal Command Line Environment
# emacs first, always
echo "Installing Emacs"
brew install emacs

# Get Nerd Fonts I might like
echo "Installing Nerd Fonts"
brew install font-meslo-lg-nerd-font

## Install and configure OhMyZsh
echo "Installing OhMyZsh, OhMyPosh, and Zsh Plugins"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## Install  OhMyPosh
brew install oh-my-posh

## Make cache directory for omp cache files
mkdir ~/.cache
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

## Update config files for emacs and zsh
echo "Copying your config files to their primary locations..."
cp ~/sbemode/code/config_files/backup.emacs.lsp ~/.emacs
cp ~/sbemode/code/config_files/backup.zshrc ~/.zshrc
cp ~/sbemode/code/config_files/backup.mytheme.omp.json ~/.mytheme.omp.json
cp ~/sbemode/code/config_files/backup.com.apple.Terminal.plist ~/Library/Preferences/com.apple.Terminal.plist
echo "Base environment installed."
echo "Moving on to graphical apps."
sleep 2

## Install dockutil and clear dock
echo "Installing dockutil and clearing the decks... er, docks."
brew install dockutil
sleep 3
dockutil --remove all

## Install GUI apps
#echo "Installing Google Chrome"
#brew install --cask chrome
#echo "Installing Firefox"
#brew install --cask firefox
echo "Installing 1Password"
brew install --cask 1password
echo "Installing VSCode"
brew install --cask visual-studio-code
echo "Installing M$ Windows App (aka RDS)"
brew install --cask windows-app
echo "Installing Spotify"
brew install --cask spotify
echo "Installing Splashtop Business"
brew install --cask splashtop-business
sleep 3

## Setup dock and open GUI apps for configuration
echo "Setting up the Dock"
dockutil --add /Applications/Google\ Chrome.app
dockutil --add /System/Applications/Utilities/Terminal.app
dockutil --add /Applications/Firefox.app
dockutil --add /Applications/Visual\ Studio\ Code.app
dockutil --add /System/Applications/System\ Settings.app
dockutil --add /Applications/1Password.app
dockutil --add /Applications/Windows\ App.app
dockutil --add /Applications/zoom.us.app
dockutil --add /System/Applications/TextEdit.app
dockutil --add /Applications/Spotify.app
dockutil --add /Applications/Splashtop\ Business.app
dockutil --add /Applications/GlobalProtect.app
dockutil --add /dockutil --add '~/Downloads' --view fan --display folder

## Start graphical apps and allow configuration
echo "Opening key apps for configuration."
open -n /Applications/Google\ Chrome.app
open -n /Applications/1Password.app
open -n /Applications/Firefox.app
open -n /Applications/Visual\ Studio\ Code.app
open -n /Applications/Splashtop\ Business.app

## Install more brew cli stuff
echo "Brewing core and filesystem utils (coreutils, tree, h&btop)"
brew install coreutils
brew install tree
brew install htop
brew install btop

## Install python
# echo "Brewing latest python release"
# brew install python

# Homebrew network tools
echo "Brewing network tools (wget, curl, speedtest, nmap, tcpdump, termshark)"
brew install wget
brew install curl
brew install speedtest-cli
brew install nmap
brew install tcpdump
brew install termshark

# Fun brew apps
echo "Brewing fun tools (cmatrix, figlet)"
brew install cmatrix
brew install figlet

# Colima and Docker
echo "Brewing colima/docker CLIs"
brew install colima
sleep 1
brew services start colima
brew install docker

# Ollama
echo "Brewing Ollama for LLMs"
brew install ollama
sleep 1
brew services start ollama
sleep 10
ollama pull llama3.2:latest
ollama pull llama3.1:latest

# Fabric
echo "Installing AI Tool - Fabric"
curl -L https://github.com/danielmiessler/fabric/releases/latest/download/fabric-darwin-arm64 > fabric && chmod +x fabric && ./fabric --version
sleep 1

# Outputs and Cleanup
echo "This is the setup file for '$NEW_HOSTNAME'" > ~/Desktop/InstallOutput.txt
brew list >> ~/Desktop/InstallOutput.txt
git config --list >> ~/Desktop/InstallOutput.txt

echo "     _                  _ "
echo "  __| | ___  _ __   ___| |"
echo " / _' |/ _ \| '_ \ / _ \ | "
echo "| (_| | (_) | | | |  __/_|"
echo " \__,_|\___/|_| |_|\___(_)"
echo ""
echo "Script done.  Don't forget to clone other key repos to ~/sbemode!!"