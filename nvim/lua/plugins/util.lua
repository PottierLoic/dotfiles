return {
	-- Undo / Redo window with tree
	{
		"mbbill/undotree",
	},
	-- Project manager
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	},
}
