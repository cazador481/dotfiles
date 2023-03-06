# Note this runs after conf.d/*

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Enable vi keybindings
    fish_vi_key_bindings
bind --preset -M visual V edit_command_buffer
end

fish_add_path --path --prepend --move \
    $HOME/.local/bin \
    $HOME/bin \
    $HOME/scripts


# The . must be at the front so that AS2 testing can work
set -gx --path --prepend PATH .

# Starship configuration  lives in ~/.config/starship.toml
if status is-interactive
    starship init fish |source
end
