# Colorize output, add file type indicator, and put sizes in human readable format
if [ $DOMAIN = 'intel' ]; then
    alias -- hsx='source ~/.hsx'
    alias -- ivx='source ~/setup_repo/ivx/setup/ivx_source'
    alias -- ksn='source ~/.ksn_a0'
    alias -- ksn_core='source /p/psn/vesta/ksn_startup.csh'
    10nm() {
        source /p/srvr10nm/lv/cfg/rtl.rc
        alias gen_resource="/p/srvr10nm/lv/work/jrafflec/generate_resource_xml.pl cfg/resource.xml"
        alias test_ll='bin/run_test --tc_name=ll_bfm_test_base --model=basic_ll_bfm'
    }
fi;
alias ls='ls --color=auto -h'
alias grep='grep --color=auto'
alias dir='ls -la'
alias g='gvim'
alias dc='cd'

alias -- vnc_setup='vncserver -geometry 5012x960 -randr 5012x980,3840x1080,1280x1024,1680x1050,1920x1200,1040x1050'
alias s_zsh='source $HOME/.zshrc'
# which () { alias | /usr/intel/00r1/bin/gwhich -i $* }

#open with
alias -s vh=gvim 
alias -s vs=gvim 

#git aliases
alias root='cd $(git rev-parse --show-cdup || echo ".")'
