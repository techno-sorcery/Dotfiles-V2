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
PS1='%F{10}%n%f:%F{12}%~%f$ '

# Aliases
alias ls='ls --color=auto'
alias tree='tree -C'
alias less='most -s'
alias cal='ncal'
alias top='htop'
alias apt-get='apt'
alias dict='dict -d gcide'

# Env vars
export TERM=xterm-256color
export PAGER="most -s"

if [ -d "/var/lib/flatpak/exports/share/applications" ]; then
    export XDG_DATA_DIRS="/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Autorun
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi

# Created by `pipx` on 2023-07-22 22:13:31
export PATH="$PATH:/home/hayden/.local/bin"
