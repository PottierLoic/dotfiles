return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	cmd = "Neotree",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>eo",
			"<cmd>Neotree<CR>",
			desc = "[o]pen",
		},
		{
			"<leader>ec",
			"<cmd>Neotree close<CR>",
			desc = "[c]lose",
		},
		{
			"<leader>et",
			"<cmd>NeoTreeShowToggle<CR>",
			desc = "[t]oggle",
		},
	},
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
		})
	end,
}
