#!/usr/bin/env zsh

# Programs
export EDITOR="nvim"
export PAGER="most -s"
export TERM="rxvt-256color"

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


# zsh
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.cache/history"
export HISTSIZE=1000
export SAVEHIST=1000

# Paths
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share"
export PATH="$PATH:/home/hayden/.local/bin"
