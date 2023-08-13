# Znap Plugin Manager
[[ -r $ZDOTDIR/plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git $ZDOTDIR/plugins/znap
    source $ZDOTDIR/plugins/znap/znap.zsh 

# Vim bindings
bindkey -v
export KEYTIMEOUT=1

# Auto complete
autoload -U compinit
setopt menu_complete
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
compinit
_comp_options+=(globdots)   # Tab complete hidden files

# Edit lines in VIM
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^e" edit-command-line

# Options

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Automatically correct syntax
setopt CHASE_LINKS
setopt LIST_TYPES
setopt AUTO_CD

stty stop undef             # Disable terminal freeze via ^s

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Prompt string
PS1='%F{10}%n%f:%F{12}%~%f$ '

# Autorun
source "$ZDOTDIR/autorun"

# Aliases
source "$ZDOTDIR/aliases"

# Plugins
source "$ZDOTDIR/plugins/cursor.zsh"
# source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
# source "$ZDOTDIR/plugins/bd.zsh"
#source "$ZDOTDIR/plugins/surround.zsh"
#source "$ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
znap source zdharma-continuum/fast-syntax-highlighting
znap source hlissner/zsh-autopair
