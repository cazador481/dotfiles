alias ls='ls --color=auto -h'
alias grep='grep --color=auto'
alias dir='ls -lA'
alias dc='cd'

alias -- vnc_setup='vncserver -geometry 5012x960 -randr 5012x980,3840x1080,1280x1024,1680x1050,1920x1200,1040x1050'
alias s_zsh='zgen reset;source $HOME/.zshrc'
# which () { alias | /usr/intel/00r1/bin/gwhich -i $* }

#open with
alias -s vh=$EDITOR
alias -s vs=$EDITOP 
alias -s log=$EDITOR
alias -s out=$EDITOR

#git aliases
alias root='cd $(git rev-parse --show-cdup || echo ".")'
alias -- tmux='tmux -2'
