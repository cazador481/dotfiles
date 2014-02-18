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
#export LD_LIBRARY_PATH=${LD_RUN_PATH}:$HOME/local/lib:/usr/intel/pkgs/openssl/1.0.1c/lib64
#export LD_RUN_PATH=${LD_RUN_PATH}:/$HOME/local/lib
#export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:$HOME/local/lib/pkgconfig:/usr/intel/pkgs/openssl/1.0.1c/lib64/

source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/exports.zsh
source $HOME/.zsh/setopt.zsh
source $HOME/.zsh/completion.zsh
