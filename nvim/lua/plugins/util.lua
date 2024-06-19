return {
	-- Restore sessions
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		config = function()
			require("persistence").setup()
		end,
	},
	-- Undo / Redo window with tree
	"mbbill/undotree",
	keys = {
		{
			-- TODO: find a mapping that is good
			"<leader>ou",
			vim.cmd.UndotreeToggle,
			desc = "[u]ndotree",
		},
	},
}
