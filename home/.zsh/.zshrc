# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/nfs/pdx/home/elash1/.zshrc'

autoload -Uz compinit
compinit -u
prompt='$PROJECT:$STEPPING[%~]%%'
prompt2='%R? '
prompt3='CORRECT>%R (y|n|e|a)? '


source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/exports.zsh
