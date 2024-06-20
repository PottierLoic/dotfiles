local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "AdventureTime"
config.font = wezterm.font("0xProto Nerd Font Mono")

-- tab bar
config.window_frame = {
	font = wezterm.font("0xProto Nerd Font Mono"),
	active_titlebar_bg = "#1f1d45",
	inactive_titlebar_bg = "#f8dcc0",
}
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#1f1d45",
			fg_color = "#f8dcc0",
			intensity = "Bold",
		},
		inactive_tab = {
			bg_color = "#28265a",
			fg_color = "#f8dcc0",
		},
		inactive_tab_hover = {
			bg_color = "#28265a",
			fg_color = "#ffffff",
		},
		new_tab = {
			bg_color = "28265a",
			fg_color = "f8dcc0",
		},
		new_tab_hover = {
			bg_color = "28265a",
			fg_color = "ffffff",
		},
	},
}

config.window_background_opacity = 0.90
config.window_decorations = "RESIZE"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
