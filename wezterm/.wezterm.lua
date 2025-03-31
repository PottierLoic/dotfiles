local wezterm = require("wezterm")
local config = wezterm.config_builder()

local color_file = wezterm.config_dir .. "/.wezterm/colors.lua"
local colors = dofile(color_file)

-- TODO: Remove this horrible thing
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.font = wezterm.font("FiraCode Nerd Font Mono")
else
	config.font = wezterm.font("FiraCode Nerd Font")
end

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
config.keys = {
	{
		key = "h",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL|ALT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

return config
