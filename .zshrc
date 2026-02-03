# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thimon/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
eval "$(starship init zsh)"

# modern CLI tools
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"

alias cat="bat"
