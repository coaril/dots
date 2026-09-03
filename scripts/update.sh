#!/usr/bin/env bash

set -eu

GREEN="\e[1;32m"
RESET="\e[0m"

echo -e "[i]${GREEN} Updating system packages:${RESET}\n"

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo -e "\n[i]${GREEN} Updating user packages:${RESET}\n"

# sudo flatpak update --system -y
brew update
brew upgrade -y
brew autoremove
brew cleanup
bun update -g

echo -e "\n[i]${GREEN} Done.${RESET}"
