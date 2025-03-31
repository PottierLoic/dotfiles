return {
	-- Tabs on top
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({
				options = {
					always_show_bufferline = true,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo-tree",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
		end,
	},
	-- Bottom status line
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					globalstatus = true,
				},
			})
		end,
	},
	-- Replace messages, cmdline ...
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = false,
			},
		},
	},
	-- Icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- UI components
	{ "MunifTanjim/nui.nvim", lazy = true },
}
