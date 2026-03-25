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
setopt HIST_IGNORE_SPACE

# ===========================
# Keybindings
# ===========================
bindkey -v
export KEYTIMEOUT=1 # makes esc mode switching faster
bindkey '^R' fzf-history-widget   # fzf Ctrl-R
bindkey '^E' autosuggest-accept   # accept ghost text
bindkey '^ ' autosuggest-accept   # ctrl+space also accepts

# Fix backspace/delete in vi mode
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

bindkey -M vicmd '^?' backward-delete-char
bindkey -M vicmd '^H' backward-delete-char

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
--preview 'bat --style=numbers --color=always {}'
--preview-window=right:60%
"

export EDITOR="nvim"


# ===========================
# Modern CLI tools
# ===========================
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias cat="bat"
alias cd="z"
alias snvim='sudo XDG_CONFIG_HOME=$HOME/.config nvim'

# Dotnet tools
export PATH="$PATH:$HOME/.dotnet/tools"

# Better cursor (indicating whether insert or visual mode)
function zle-keymap-select {
  case $KEYMAP in
    vicmd) echo -ne '\e[1 q' ;;   # block
    viins|main) echo -ne '\e[5 q' ;;  # beam
  esac
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[5 q'
}
zle -N zle-line-init

function zle-line-finish {
  echo -ne '\e[5 q'
}
zle -N zle-line-finish

## SHOULD BE LOADED LAST!
# ===========================
# Autosuggestions (ghost text)
# ===========================
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ===========================
# Syntax highlighting
# ===========================
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
