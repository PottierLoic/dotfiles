return {
	-- Tabs on top
	{
		"akinsho/bufferline.nvim",
    event = "BufReadPre",
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
}
