# Note this runs after conf.d/*
if status is-interactive
    and not set -q TMUX
    and not set -q VSCODE_GIT_ASKPASS_MAIN
    and not set -q CURSOR_NO_INTERACTION
      tmux attach ;or tmux
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Enable vi keybindings
    fish_vi_key_bindings
    bind --preset -M visual V edit_command_buffer

    # Forces the termianl cursor shape to reflect vi mode
    # set fish_v_force_cursor 1

    # only run if host contains eash.sc.vxp 
    if string match --quiet --regex "eash.sc.vxp" $HOST
        /home/eash/.atuin/bin/atuin init --disable-up-arrow fish | source
    end
end

fish_add_path --path --prepend --move $HOME/.cargo/bin
# fish_add_path --path --prepend --move $HOME/.pyenv/bin
# $HOME/.pyenv/bin/pyenv init - | source

fish_add_path --path --prepend --move \
    $HOME/.local/bin \
    $HOME/bin \
    $HOME/scripts

function refresh_tmux_vars --on-event="fish_preexec"
  if set -q TMUX
    bass (tmux show-environment -s)
  end
end

# The . must be at the front so that AS2 testing can work
set -gx --path --prepend PATH .

# if test -f $HOME/bin/agent-bridge.sh
    # bass source $HOME/bin/agent-bridge.sh
# end


# Starship configuration  lives in ~/.config/starship.toml
if status is-interactive
    and not set -q CURSOR_AGENT
    and not set -q CURSOR_NO_INTERACTION
    starship init fish |source
    enable_transience
end


# This is needed because cursor mcp sends a q to exit the terminal sometimes
abbr q exit 0
