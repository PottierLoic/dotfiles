return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
    lazy = false,
    priority = 1000,
		config = function()
			require("catppuccin").setup({
				background = {
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
}
