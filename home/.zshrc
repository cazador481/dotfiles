# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

GENCOMPL_FPATH=$HOME/.zsh/completion # zsh-competion-generator path

source $HOME/.homesick/repos/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle brew
antigen bundle git
antigen bundle cpanm
antigen bundle extract
antigen bundle vi-mode
antigen bundle mosh
antigen bundle RobSis/zsh-completion-generator
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle history-substring-search

antigen theme gnzh

antigen apply


# # Path to your oh-my-zsh installation.
# #
# export ZSH=$HOME/.oh-my-zsh
#
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#  ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"


# Uncomment the following line to enable command auto-correction.
 #ENABLE_CORRECTION="true"



# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh/plugins/

fpath=( /home/eash/.zsh/completion/ $fpath )
# fpath=( /home/eash/.homesick/repos/zsh-completions/src /home/eash/.zsh/completion/ $fpath )
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(brew git cpanm extract vi mosh jira zsh-syntax-highlighting history-substring-search )
# plugins=(brew git cpanm extract vi mosh zsh-syntax-highlighting history-substring-search )

# source $ZSH/oh-my-zsh.sh


bindkey -v


# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
setopt prompt_subst


setopt shwordsplit

s=`hostname -d`
a=("${(s/./)s}")
export DOMAIN=$a[1];
if [ $DOMAIN = 'nvidia' ]; then
    echo "sourcing nvidia"
    source $HOME/.zsh/nvidia.zsh
fi

source $HOME/.homesick/repos/homeshick/homeshick.sh
# source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh

source $HOME/perl5/perlbrew/etc/bashrc >&/dev/null


precmd() {
    if [[ -n $TMUX ]]; then
        for name in `tmux ls -F '#{session_name}'`; do
            tmux setenv -g -t $name DISPLAY $DISPLAY #set display for all sessions
        done 
        export `tmux show-environment DISPLAY`;
    fi;
}

parts=(${(s:.:)HOST})
for i in {${#parts}..1}; do
    profile=${(j:.:)${parts[$i,${#parts}]}}
    file=$ZSH_CUSTOM/profiles/$profile
    if [ -f $file ]; then
        source $file
    fi
done



#  zstyle ':vcs_info:*' enable git p4
#  zstyle ':vcs_info:*' use-server true 
# RPROMPT='${vcs_info_msg_0_}%# '
#
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down#

#
# # bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
#
# # bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

function resolve-alias
{
typeset -a cmd
cmd=(${(z)1})
while (( ${+aliases[$cmd[1]]} )) \
        && [[ ${aliases[$cmd[1]]} != $cmd ]]; do
  cmd=(${(z)aliases[${cmd[1]}]})
  done
  echo $cmd
  }
## http://www.zsh.org/mla/users/2010/msg00769.html                                                                                                                       
function rationalise-dot() {                                                                                                                                             
    local MATCH # keep the regex match from leaking to the environment                                                                                                   

    if [[ $LBUFFER =~ '(^|/| |  |'$'\n''|\||;|&)\.\.$' ]] \
        && ! [[ $(resolve-alias $LBUFFER) =~ '^(git|tig|p4)' ]]; then
    LBUFFER+=/
    zle self-insert
    zle self-insert
else
    zle self-insert
fi

}                                                                                                                                                                        
zle -N rationalise-dot                                                                                                                                                   
bindkey . rationalise-dot                                                                                                                                                
bindkey -M isearch . self-insert                                                                                                                                         
