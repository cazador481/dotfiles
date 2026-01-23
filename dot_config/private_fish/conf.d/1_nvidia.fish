# Set XDG directories, also set in ~/.cshrc_custom
set -xg XDG_DATA_HOME /home/eash/scratch/.local
set -xg XDG_CACHE_HOME /home/eash/scratch/.cache

# P4 Env variables
set -xg P4CONFIG .p4config
set -xg P4IGNORE .p4ignore:/home/eash/.p4ignore
# Set to null otherwise the P4ENVIRO file grows huge, and slows down every p4 command
set -xg P4ENVIRO /dev/null

set -xg CC gcc


# LSF Setup
set -xg LSF_SERVERDIR /usr/local/lsf/etc

source /home/nv/utils/ci/nvci_setup/nvci-setup.fish

fish_add_path --path --prepend --move \
    /home/utils/fzf-0.29.0/bin \
    /home/autosubmit/bin \
    /home/nv/utils/crucible/1.0/bin \
    /home/nv/utils/hwmeth/bin \
    /home/nv/utils/quasar/bin \
    /home/utils/Python/3.9/3.9.9-20220110/bin/ \
    /home/utils/direnv-2.30.3/bin \
    /home/utils/gcc-11.2.0/bin \
    /home/utils/git-2.45.2/bin \
    /home/utils/go-1.18/bin/ \
    /home/utils/htop-1.0/bin/ \
    /home/utils/jq-1.6/bin \
    /home/utils/llvm-20.1.0/bin \
    /home/utils/make-4.3/bin \
    /home/utils/neovim-0.11.2/bin \
    /home/utils/node-v16.16.0/bin \
    /home/utils/ruby-3.2.2/bin \
    # /home/utils/rust-1.85.1/bin \
    /home/utils/shellcheck-v0.7.1/ \
    /home/utils/tmux-3.5a/bin \
    /usr/local/lsf/bin \
    /home/utils/fd-8.7.1/bin \
    /home/utils/ripgrep-13.0.0/bin \
    /home/utils/luarocks-2.4.1/bin \
    /home/utils/fish-3.6.1/bin \
    /home/nv/bin
fish_add_path --path --append -- move /home/utils/bin /bin

# if test -f /home/nv/utils/ci/nvci_setup/nvci-setup.sh
#     bass source /home/nv/utils/ci/nvci_setup/nvci-setup.sh
# end

# Aliases
alias nvim="PATH=/home/utils/tree-sitter-0.25.6/bin/:$PATH CC=clang CXX=clang++ LDFLAGS='-static-libgcc -static-libstdc++' command nvim"
alias clean_workspace="workspace_manager list |grep f_hwinf_ci | grep -v test_run | grep -v .workspace| grep -v test_snapshot|xargs -P8 -n1 -t -r workspace_manager delete -f -d"

# Abbreviations
abbr qs4 qsub -Is -n4 -app affinity -app c75docker -q o_cpu_16G_1H -R '"span[hosts=1]"' -m rel7x
abbr qs qsub -Is -n2 -app affinity -app c75docker -q o_cpu_16G_1H -R '"span[hosts=1]"' -m rel7x
