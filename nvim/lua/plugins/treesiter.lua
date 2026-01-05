return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
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
			highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
			indent = { enable = true },
		},
	},
}
