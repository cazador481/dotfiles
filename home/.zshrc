# Path to your oh-my-zsh installation.
#
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
 ZSH_THEME="gnzh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
 DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

fpath=( /home/eash/.homesick/repos/zsh-completions/src /home/eash/.zsh/completion/ $fpath )
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew git cpanm extract vi zsh-syntax-highlighting zsh-history-substring-search )

source $ZSH/oh-my-zsh.sh
bindkey -v

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


















# Lines configured by zsh-newuser-install
#
#
#
#
#
#
#
#
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
# setopt appendhistory autocd extendedglob nomatch
# unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# autoload -Uz compinit
# autoload -Uz vcs_info
# compinit -u
setopt prompt_subst


setopt shwordsplit

s=`hostname -d`
a=("${(s/./)s}")
export DOMAIN=$a[1];

if [ DOMAIN = 'intel' ]; then

fi
#export LD_LIBRARY_PATH=${LD_RUN_PATH}:$HOME/local/lib:/usr/intel/pkgs/openssl/1.0.1c/lib64
#export LD_RUN_PATH=${LD_RUN_PATH}:/$HOME/local/lib
#export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:$HOME/local/lib/pkgconfig:/usr/intel/pkgs/openssl/1.0.1c/lib64/

source $HOME/.homesick/repos/homeshick/homeshick.sh
# source $HOME/.zsh/functions.zsh
source $HOME/.zsh/aliases.zsh
# source $HOME/.zsh/exports.zsh
# source $HOME/.zsh/setopt.zsh
# source $HOME/.zsh/completion.zsh
source $HOME/.zsh/nvidia.zsh
source $HOME/perl5/perlbrew/etc/bashrc >&/dev/null


# precmd() {
#     psvar=()
#     vcs_info
# }

#  zstyle ':vcs_info:*' enable git p4
#  zstyle ':vcs_info:*' use-server true 
# RPROMPT='${vcs_info_msg_0_}%# '
#
# bind UP and DOWN arrow keys
 zmodload zsh/terminfo
 bindkey "$terminfo[kcuu1]" history-substring-search-up
 bindkey "$terminfo[kcud1]" history-substring-search-down
#
# # bind P and N for EMACS mode
 bindkey -M emacs '^P' history-substring-search-up
 bindkey -M emacs '^N' history-substring-search-down
#
# # bind k and j for VI mode
 bindkey -M vicmd 'k' history-substring-search-up
 bindkey -M vicmd 'j' history-substring-search-down

 compdef _gnu_generic automate_any.pl

 #p4 completion
zstyle ':completion:*p4-*:changes' changes -u $USER
