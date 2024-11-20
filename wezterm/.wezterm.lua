local wezterm = require("wezterm")
local config = wezterm.config_builder()

local color_file = wezterm.config_dir .. "/.wezterm/colors.lua"
local colors = dofile(color_file)

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.enable_csi_u_key_encoding = true

config.colors = colors

config.window_background_opacity = 0.85
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.enable_wayland = false

return config
