-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
-- config.color_scheme = 'AdventureTime'

config.term = "xterm-256color"

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- Use Ssh2 backend for SSH connections, so that 1Password SSH agent can be used.
config.ssh_backend = "Ssh2"
-- to be able to get shift enter to work for claude
config.keys = {
  {
    key = 'Backspace',
    mods = '',
    action = wezterm.action.SendString '\x08',
  },

    {
      key = 'Enter',
      mods = 'SHIFT',
      action = wezterm.action.SendString('\x1b[13;2u'),
    },
  }


-- Finally, return the configuration to wezterm:
return config