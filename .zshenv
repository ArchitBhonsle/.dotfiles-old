export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export LESSHISTFILE=-
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"

export EDITOR="vim"
export TERMINAL="kitty"
export BROWSER="firefox"

export GOPATH="$XDG_DATA_HOME/go"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

path+=("$HOME/.local/bin" "$XDG_DATA_HOME/cargo/bin" "$XDG_DATA_HOME/go/bin")
export PATH

source "$CARGO_HOME/env"
