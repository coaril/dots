# ~/.zshrc

# =====
# Setup
# =====

HISTFILE=~/.zsh_history
HISTSIZE=400
SAVEHIST=400

# Prompt
autoload -Uz promptinit
promptinit
prompt adam1

# Enable command auto-correction
setopt correct

# Enable autocompletion
autoload -Uz compinit
compinit

# Load custom aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases

# ===
# SSH
# ===

# To disable MOTD's (Ubuntu):
# sudo vim /etc/pam.d/sshd
# sudo vim /etc/pam.d/login

# ==========
# Enviroment
# ==========

export PATH="$HOME/.local/bin:$PATH"

export EDITOR=vim

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Bun
export PATH="/home/me/.bun/bin:$PATH"

# Zoxide
eval "$(zoxide init zsh)"

# Rust
. "$HOME/.cargo/env"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
