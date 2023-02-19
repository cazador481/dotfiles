if status is-interactive
    # Commands to run in interactive sessions can go here

    # Enable vi keybindings
    fish_vi_key_bindings
end

fish_add_path --path --prepend --move \
    . \
    $HOME/.local/bin \
    $HOME/bin \
    $HOME/scripts \
    /home/utils/fzf-0.29.0/bin \
    /home/autosubmit/bin \
    /home/nv/utils/crucible/1.0/bin \
    /home/nv/utils/hwmeth/bin \
    /home/nv/utils/quasar/bin \
    /home/utils/Python/3.9/3.9.9-20220110/bin/ \
    /home/utils/direnv-2.30.3/bin \
    /home/utils/gcc-11.2.0/bin \
    /home/utils/git-2.38.0/bin \
    /home/utils/go-1.18/bin/ \
    /home/utils/jq-1.6/bin \
    /home/utils/llvm-14.0.0/bin \
    /home/utils/make-4.3/bin \
    /home/utils/neovim-0.8.0/bin \
    /home/utils/node-v14.5.0/bin \
    /home/utils/ruby-2.2.2/bin \
    /home/utils/rust-1.59.0/bin/ \
    /home/utils/shellcheck-v0.7.1/ \
    /home/utils/tmux-3.2a/bin \
    /usr/local/lsf/bin \
    /home/nv/bin
fish_add_path --path --append -- move /home/utils/bin /bin
    # /home/utils/the_silver_searcher-0.32.0/bin
    # /home/utils/mosh-1.3.2-90-g03087e7/bin

if test -f /home/nv/utils/ci/nvci_setup/nvci-setup.sh
    bass source /home/nv/utils/ci/nvci_setup/nvci-setup.sh
end
# Enable vi keybindings
fish_vi_key_bindings

starship ini:t fish |source
