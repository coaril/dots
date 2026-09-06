#!/usr/bin/env bash

set -eu

GREEN="\e[1;32m"
RESET="\e[0m"

echo -e "[i]${GREEN} Updating system packages:${RESET}\n"

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# System packages
PACKAGES=(
  # Core
  build-essential
  curl
  git
  util-linux
  rsync
  ffmpeg

  # System
  btop
  ufw

  # Shell
  eza
  zoxide
  zsh

  # Dev
  vim
  tmux

  # Misc
  fastfetch
)

echo -e "\n[i]${GREEN} Installing user packages (apt):${RESET}\n"
sudo apt install -y "${PACKAGES[@]}"

echo -e "\n[i]${GREEN} Installing brew:${RESET}\n"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo -e "\n[i]${GREEN} Installing user packages (brew):${RESET}\n"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install nvm bun gh neovim antigravity-cli

# Git
git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global user.name "Coaril"
git config --global user.email "294928377+coaril@users.noreply.github.com"

# Node
echo -e "\n[i]${GREEN} Installing node:${RESET}\n"
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm install --lts

# Bun packages
echo -e "\n[i]${GREEN} Installing user packages (bun):${RESET}\n"
bun install -g vite npm-check-updates wrangler

# Firewall
echo -e "\n[i]${GREEN} Setting up firewall:${RESET}\n"
sudo ufw --force enable
sudo systemctl enable --now ufw
sudo ufw allow ssh
sudo ufw reload

# Default shell
echo -e "\n[i]${GREEN} Setting default shell:${RESET}\n"
sudo usermod --shell "$(which zsh)" "$USER"

# Shell plugins
echo -e "\n[i]${GREEN} Installing shell plugins:${RESET}\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

echo -e "\n[i]${GREEN} Finalizing:${RESET}\n"

# Copy dots
cp -rt $HOME .tmux.conf .zsh* .config .gemini

# Copy scripts
mkdir -p $HOME/Code/Scripts
cp -t $HOME/Code/Scripts ./scripts/*

# Symlink script copy to ~/.local/bin
mkdir -p $HOME/.local/bin/
ln -s $HOME/Code/Scripts/update.sh $HOME/.local/bin/update

# Cleanup
rm -f "$HOME"/.bash* "$HOME"/.profile

echo -e "\n[i]${GREEN} Done.${RESET}"
