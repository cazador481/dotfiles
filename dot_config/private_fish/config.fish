# Note this runs after conf.d/*
if status is-interactive
    and not set -q TMUX
    tmux attach ;or tmux
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Enable vi keybindings
    fish_vi_key_bindings
    bind --preset -M visual V edit_command_buffer
end
fish_add_path --path --prepend --move $HOME/.pyenv/bin
$HOME/.pyenv/bin/pyenv init - | source

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

if test -f $HOME/bin/agent-bridge.sh
    bass source $HOME/bin/agent-bridge.sh
end


# Starship configuration  lives in ~/.config/starship.toml
if status is-interactive
    starship init fish |source
    enable_transience
end
