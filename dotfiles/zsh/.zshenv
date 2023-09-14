#!/usr/bin/env zsh

# Main user
export MAIN_USER="hayden"

# Programs
export EDITOR="nvim"
export PAGER="most -s"
export TERM="rxvt-256color"

# java
export _JAVA_AWT_WM_NONREPARENTING=1

# fzf
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='ag -p ~/.gitignore -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh
export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$HOME/.cache/zhistory"
export HISTSIZE=1000
export SAVEHIST=1000

# Paths
export XDG_DATA_DIRS="/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share"
export PATH="$PATH:/home/hayden/.local/bin"
