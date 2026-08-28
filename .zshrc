# ~/.zshrc

# History
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
