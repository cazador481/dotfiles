# Currently this path is appendend to dynamically when picking a ruby version


# Setup terminal, and turn on colors
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions

export LESS='--ignore-case --raw-control-chars'
export PAGER='less'
export EDITOR='vim'

# CTAGS Sorting in VIM/Emacs is better behaved with this in place
export LC_COLLATE=C

if [ $DOMAIN = 'intel' ];then
    export VIMRUNTIME="$HOME/setup_repo/vim/share/vim/vim74/"

    export MANPATH='/usr/local/man:/usr/share/man:/usr/X11R6/man:/opt/gnome/share/man:/opt/quest/man:/usr/local/man:/usr/share/man:/usr/X11R6/man:/opt/gnome/share/man:/opt/quest/man:/usr/intel/man:/usr/share/man:/usr/X11R6/man:/opt/gnome/share/man:/usr/local/man:/opt/quest/man'
    export NNTPSERVER='news.intel.com'
    export INFODIR='/usr/local/info:/usr/share/info:/usr/info'
    export USER_ITOOLS="$HOME/.itools"
    export EC_ENV_PROJ='default'
    export GS_LIB="$HOME/.fonts"
    export MORE='-sl'
    export LM_PROJECT='MC_DCG-DCG_IFL'
    export QTDIR='/usr/lib/qt3'

    #proxy info
    export https_proxy='http://proxy.fm.intel.com:911'
    export http_proxy='http://proxy.fm.intel.com:911'
    export ftp_proxy='ftp://proxy.fm.intel.com'
    export FTP_PASSIVE='1'

    export PATH="$HOME/setup_repo/vim/bin:/usr/intel/bin:/bin:/usr/bin:.:/usr/sbin:/usr/bin/X11:/usr/X11R6/bin:/opt/gnome/bin:/opt/kde3/bin:/usr/local/bin:/usr/games:/usr/lib/mit/bin:/usr/lib/mit/sbin:/usr/lib/qt3/bin:$HOME/local/bin"

    export MAIL='/var/spool/mail/elash1'
    export GIT_SSL_NO_VERIFY='true'
    export PRINTER='mmdc_23j11pub1.hd.intel.com'
    export GTK_PATH64='/usr/local/lib64/gtk-2.0:/opt/gnome/lib64/gtk-2.0:/usr/lib64/gtk-2.0'
    export EC_ENV_ROOT='/usr/intel/common/pkgs/eclogin/1.0'
    #export PKG_CONFIG_PATH='/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib64/pkgconfig:/usr/share/pkgconfig:/opt/kde3/lib64/pkgconfig:/opt/gnome/lib64/pkgconfig:/opt/gnome/lib64/pkgconfig:/opt/gnome/share/pkgconfig'
    export IWRAPPER_DEPTH='0,1380573659'
    export INFOPATH="$INFOPATH:/usr/intel/pkgs/info/LATEST:/usr/local/info:/usr/share/info:/usr/info:/opt/gnome/share/info"
    export STEPPING=''
    #smart dirs
    srvr10nm='/nfs/pdx/disks/srvr10nm_0043/elash1/'
fi


