#{{{ man pages shortcutes & settings
alias -- fmman='man -M ${FM_ROOT}/doc/fm/man'
alias -- synman='man -M $SYNOPSYS/doc/syn/man'
export MANPATH='/usr/local/lsf/man:/home/utils/man:/usr/man:/home/eash/man:/usr/share/man:/home/tools/synopsys/syn_2010.12-SP5/doc/syn/man:/home/tools/synopsys/pt_2009.06-SP3/doc/syn/man:/home/xl_98/tools.sun4/man/man1:/home/xl_98/tools.sun4/man/man5'
#}}}
alias perltidy='/home/utils/perl-5.16/5.16.2-nothreads-64/bin/perltidy'


alias pwd='pwd -P'


checkbuild () { egrep -i '(\*\*|error)' $* | grep -v ignore }
en () { setenv FNAME $*; e -fn 8x13 -name `basename $FNAME` $* & }
enscriptp () { print -p$*.ps $* }
errgrep () { grep Error $* | egrep -v "msg =|Test-Compiler"|more }
es () { setenv FNAME $*; e -fn 6x12 -name `basename $FNAME` $* & }
p4_filelog () { p4 filelog -l $* | more }
sh_path () { echo $* | sed 's/\/home\/eash/\\~/' }
su () { /bin/su $*; tup }
title () { echo -n '^[]2;$*^G' }

get_best_cl () { bin/sync_tree -cl `bin/get_autofetch_cl` }

rm_client ()
{
    p4 -c $1 revert -k //...
    p4 changes -c $1 -s pending | cut -d" " -f2 |xargs -n1 p4 -c $1 change -d
    p4 client -d $1 
}

PATH+=':/home/eash/scripts/:/home/utils/tmux-1.9a/bin/'
# PATH='/home/eash/scripts/:/home/utils/tmux-1.9a/bin/:/home/utils/the_silver_searcher-20140422/bin/:/home/utils/git-1.9.2/bin:/home/utils/git-1.9.0/libexec:/home/utils/vim-7.4/bin/:/home/utils/cmake-2.8.12.2/bin/:/home/eash/bin:/home/utils/bin:/bin:/home/gnu/bin:/usr/bin:.:/sbin:/usr/sbin:/usr/ucb:/usr/ccs/bin:/usr/lib:/etc:/home/nv/bin:/usr/bin/X11:/usr/local/lsf/bin:/home/tools/td/td5303/linux/bin:/home/tools/synopsys/syn_2010.12-SP5/bin:/home/tools/synopsys/pt_2009.06-SP3/bin:/home/tools/synopsys/syn_2010.12-SP5/linux/mc/bin:/home/tools/synopsys/fm_2010.12-SP5/bin:/home/tools/verilint/2001.4.10-linux2.2:/home/tools/debussy/latest/bin:/home/tools/debussy/verdi_latest/bin'

#{{{ perlbrew
#}}}
 export PATH
# source ~/perl5/perlbrew/etc/bashrc
#{{{perlforce w/ crucible wrapper 
export P4DIFF='/home/utils/mgdiff-1.0-2/bin/mgdiff'

function p4() {
PERL5LIB=''
/home/nv/utils/crucible/1.0/bin/p4 -d `/bin/pwd` $@

}
# alias -- p4='/home/nv/utils/crucible/1.0/bin/p4 -d `/bin/pwd`'
alias -- p4_diff='p4_xdiff -d'
alias -- p4_log='p4_filelog'
#}}}

export P4PORT='p4hw:2001'
export P4CONFIG='.p4config'


export MCLIBDIR='/home/tools/synopsys/syn_2010.12-SP5/mc/tech'

function vim ()
{
    OLD_PERL=$PERLBREW_PERL 
    OLD_LIB=$PERLBREW_LIB
    perlbrew use 5.16.2-nothreads-64@vim  >&/dev/null
    /home/utils/vim-7.4/bin/vim $*
    perlbrew use $OLD_PERL  >& /dev/null
}
#
#navigate nvidia tree {{{
d_tests(){ cd `depth_ea`/diag/tests}
testgen(){ cd `depth_ea`/diag/testgen}
tot() {cd `depth_ea`}
#}}}

unset SSH_ASKPASS

compdef _gnu_generic automate_any.pl

#p4 completion
zstyle ':completion:*p4-*:changes' changes -u $USER


alias dzil='PERL5LIB=`/home/eash/scripts/perlcustomlib` dzil'


function hwmeth ()
{
    cd ~/scratch/script_dev/dev/inf/hwmeth/mainline
}
# vim: set fdm=marker:
