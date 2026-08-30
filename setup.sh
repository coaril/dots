#!/usr/bin/env bash

set -eu

# Update
sudo dnf upgrade -y

# RPM Fusion
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# System packages
sudo dnf install -y \
  gcc \
  util-linux \
  python3 \
  rust \
  cargo \
  ffmpeg \
  btop \
  ufw \
  curl \
  eza \
  fastfetch \
  git \
  gh \
  tmux \
  upower \
  vim \
  zoxide \
  zsh

# Default shell
sudo usermod --shell "$(which zsh)" "$USER"

# Shell plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh/zsh-syntax-highlighting"

# Homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Brew packages
brew install nvm bun neovim uv

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"
nvm install --lts

# Bun packages
bun install -g vite npm-check-updates wrangler

# Firewall
sudo systemctl disable --now firewalld
sudo ufw --force enable
sudo systemctl enable --now ufw
sudo ufw allow ssh
sudo ufw reload

# Dotfiles
cp -rt "$HOME" .tmux.conf .zsh* .config
