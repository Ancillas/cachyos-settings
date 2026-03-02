local wezterm = require 'wezterm'
-- term = "xterm-256color",
local config = wezterm.config_builder and wezterm.config_builder() or {}

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11.0

-- Color theme
config.color_scheme = "Ayu Mirage"

-- Default shell
config.default_prog = { "C:\\Program Files\\nu\\bin\\nu.exe" }

-- Optional
config.window_background_opacity = 0.95

config.launch_menu = {
  {
    label = "Nushell",
    args = { "C:\\Program Files\\nu\\bin\\nu.exe" },
  },
  {
    label = "PowerShell",
    args = { "powershell.exe" },
  },
  {
    label = "Command Prompt",
    args = { "cmd.exe" },
  },
}

return config
