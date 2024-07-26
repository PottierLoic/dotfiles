-- All the themes installed can be displayed and selected in the Themery list
-- TODO: change wezterm color too on theme switch
return {
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "maxmx03/fluoromachine.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				integrations = {
					cmp = true,
					dashboard = true,
					bufferline = true,
					indent_blankline = { enabled = true },
					neotree = true,
					noice = true,
					telescope = true,
					treesitter = true,
					gitsigns = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	-- Theme manager
	{
		"zaldih/themery.nvim",
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "Catppuccin Mocha",
						colorscheme = "catppuccin-mocha",
						before = [[
              require('catppuccin').setup({
                transparent_background = true,
              })
            ]],
					},
					{
						name = "Catppuccin Latte",
						colorscheme = "catppuccin-latte",
						before = [[
              require('catppuccin').setup({
                transparent_background = false,
              })
            ]],
					},
					{
						name = "Tokyonight Night",
						colorscheme = "tokyonight-night",
						before = [[
              require('tokyonight').setup({
                transparent_background = false,
              })
            ]],
					},
					{
						name = "Tokyonight Day",
						colorscheme = "tokyonight-day",
						before = [[
              require('tokyonight').setup({
                transparent_background = false,
              })
            ]],
					},
					{
						name = "Kanagawa Lotus",
						colorscheme = "kanagawa-lotus",
						before = [[
              require('kanagawa').setup({
                transparent_background = false,
              })
            ]],
					},
					{
						name = "Fluoromachine",
						colorscheme = "fluoromachine",
						before = [[
              require('fluoromachine').setup({
              transparent_background = false,
              })
            ]],
					},
				},
				livePreview = true,
			})
		end,
	},
}
