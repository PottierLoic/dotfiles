return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ensure_installed = {
				"json",
				"yaml",
				"html",
				"css",
				"javascript",
				"typescript",
				"bash",
				"python",
				"lua",
				"c",
				"cpp",
				"rust",
				"v",
				"ocaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
