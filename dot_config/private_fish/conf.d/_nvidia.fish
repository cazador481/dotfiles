# Set XDG directories, also set in ~/.cshrc_custom
set -xg XDG_DATA_HOME /home/eash/scratch/.local
set -xg XDG_CACHE_HOME /home/eash/scratch/.cache

# P4 Env variables
set -xg P4CONFIG .p4config
set -xg P4IGNORE .p4ignore:/home/eash/.p4ignore
set -xg P4ENVIRO /dev/null

set -xg CC gcc


# LSF Setup
set -xg LSF_SERVERDIR /usr/local/lsf/etc

fish_add_path --path --prepend --move \
    /home/utils/fzf-0.29.0/bin \
    /home/autosubmit/bin \
    /home/nv/utils/crucible/1.0/bin \
    /home/nv/utils/hwmeth/bin \
    /home/nv/utils/quasar/bin \
    /home/utils/Python/3.9/3.9.9-20220110/bin/ \
    /home/utils/direnv-2.30.3/bin \
    /home/utils/gcc-11.2.0/bin \
    /home/utils/git-2.42.0/bin \
    /home/utils/go-1.18/bin/ \
    /home/utils/htop-1.0/bin/ \
    /home/utils/jq-1.6/bin \
    /home/utils/llvm-14.0.0/bin \
    /home/utils/make-4.3/bin \
    /home/utils/neovim-0.10.2/bin \
    /home/utils/node-v16.16.0/bin \
    /home/utils/ruby-3.2.2/bin \
    /home/utils/rust-1.71.0/bin/ \
    /home/utils/shellcheck-v0.7.1/ \
    /home/utils/tmux-3.2a/bin \
    /usr/local/lsf/bin \
    /home/utils/fd-8.1.1/bin \
    /home/utils/ripgrep-13.0.0/bin \
    /home/utils/luarocks-2.4.1/bin \
    /home/utils/fish-3.6.1/bin \
    /home/nv/bin
fish_add_path --path --append -- move /home/utils/bin /bin

if test -f /home/nv/utils/ci/nvci_setup/nvci-setup.sh
    bass source /home/nv/utils/ci/nvci_setup/nvci-setup.sh
end

#  alias nvim="CC=gcc CXX=g++ LDFLAGS='-static-libgcc -static-libstdc++' command nvim" */
alias nvim="CC=clang CXX=clang++ LDFLAGS='-static-libgcc -static-libstdc++' command nvim"
