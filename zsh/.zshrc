# Enable colors
autoload -U colors && colors

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit -d "$XDG_CACHE_HOME/zsh/compdump"
_comp_options+=(globdots) # Include hidden files.

# vi mode {{{
bindkey -v
export KEYTIMEOUT=1

# reverse search
# bindkey "^R" history-incremental-pattern-search-backward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# }}}

# Enable the syntax highlighting plugin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Aliases {{{
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget/hsts"
alias exa="exa --all --long --icons --group-directories-first"
alias v="nvim"
alias wezterm="flatpak run org.wezfurlong.wezterm"
alias open="xdg-open"

function do_not_rm () {
  printf "\033[91mUse \033[1mtrash\033[0m \033[91minstead\033[0m\n"
  return 1
}
alias rm="do_not_rm"

function lfcd () {
    tmp="$(mktemp)"
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        command rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
alias lf="lfcd"

function dateutc () {
  date -u +%Y-%m-%dT%H:%M:%S%Z
}

# }}}

# fzf {{{

source /usr/share/fzf/shell/key-bindings.zsh

function () {
    local FZF_LAYOUT="                              \
        --height=50% --layout=reverse --info=inline \
        --border"
    local FZF_CATPPUCCIN_MOCHA="                                       \
        --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8      \
        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
        --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

    export FZF_DEFAULT_OPTS="$FZF_LAYOUT $FZF_CATPPUCCIN_MOCHA"
    export FZF_DEFAULT_COMMAND="fd --type f \
        --exclude .git --ignore-file ~/.gitignore"
}

# }}}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# vim:foldmethod=marker:foldlevel=0
