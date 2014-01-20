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
#. =(/nfs/pdx/home/elash1/c2z)

autoload -Uz compinit
compinit -u
# End of lines added by compinstall
#path=(/usr/intel/bin /bin /usr/bin . /usr/sbin /usr/bin/X11 /usr/X11R6/bin /opt/gnome/bin /opt/kde3/bin /usr/local/bin /usr/games /usr/lib/mit/bin /usr/lib/mit/sbin /usr/lib/qt3/bin)
setopt prompt_subst
prompt='$PROJECT:$STEPPING{%~}'

setopt shwordsplit

s=`domainname`
a=("${(s/./)s}")
export DOMAIN=$a[2];

if [ DOMAIN = 'intel' ]; then

fi
source $HOME/setup_repo/zsh/functions.zsh
source $HOME/setup_repo/zsh/aliases.zsh
source $HOME/setup_repo/zsh/exports.zsh
source $HOME/setup_repo/zsh/setopt.zsh
source $HOME/setup_repo/zsh/completion.zsh
