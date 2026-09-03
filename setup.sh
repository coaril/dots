#!/usr/bin/env bash

set -eu

# System packages
PACKAGES=(
  # Dev tools
  build-essential
  util-linux
  git
  vim
  # Sys Tools
  ffmpeg
  curl
  rsync
  ufw
  zsh
  # Extra
  eza
  fastfetch
  tmux
  btop
  zoxide
  # Languages
  python3
)

sudo apt install -y "${PACKAGES[@]}"

# Git
git config --global init.defaultBranch main
git config --global core.editor "nvim"
git config --global user.name "Coaril"
git config --global user.email "294928377+coaril@users.noreply.github.com"

# Brew packages
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install nvm bun neovim uv

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm install --lts

# Bun packages
bun install -g vite npm-check-updates wrangler

# Firewall
sudo ufw --force enable
sudo systemctl enable --now ufw
sudo ufw allow ssh
sudo ufw reload

# Default shell
sudo usermod --shell "$(which zsh)" "$USER"

# Shell plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# Dotfiles
cp -rt "$HOME" .tmux.conf .zsh* .config
mkdir -p "$HOME/Code/Scripts"
cp -t "$HOME/Code/Scripts" ./scripts/*
