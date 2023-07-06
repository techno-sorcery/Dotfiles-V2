# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/hayden/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt string
PS1='%F{10}[%T %n]%F{gray}:%F{12}%~%F{gray}$ '

# Aliases
alias ls='ls --color=auto'
alias tree='tree -C'
alias less='most -s'
alias cal='ncal'

# Env vars
export TERM=xterm-256color
export PAGER="most -s"
