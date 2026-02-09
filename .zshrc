# ===========================
# History
# ===========================
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# ===========================
# Keybindings
# ===========================
bindkey -v
bindkey '^R' fzf-history-widget   # fzf Ctrl-R
bindkey '^E' autosuggest-accept   # accept ghost text
bindkey '^ ' autosuggest-accept   # ctrl+space also accepts

# ===========================
# Completion
# ===========================
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ===========================
# Starship prompt
# ===========================
eval "$(starship init zsh)"

# ===========================
# Zoxide
# ===========================
eval "$(zoxide init zsh)"

# ===========================
# FZF (Ctrl-R + tab completion)
# ===========================
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS="
--height=40%
--layout=reverse
--border
--inline-info
"

# ===========================
# Autosuggestions (ghost text)
# ===========================
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ===========================
# Syntax highlighting
# ===========================
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ===========================
# Modern CLI tools
# ===========================
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias cat="bat"
alias cd="z"
