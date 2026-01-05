return {
	-- Telescope (fuzzy finder)
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
    -- stylua: ignore
		keys = {
      { "<leader>tf", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "[f]iles" },
      { "<leader>to", function() require("telescope.builtin").oldfiles() end, desc = "[o]ld (Files)" },
      { "<leader>tr", function() require("telescope.builtin").live_grep() end, desc = "[r]ipgrep" },
      { "<leader>tb", function() require("telescope.builtin").buffers() end, desc = "[b]uffers" },
      { "<leader>th", function() require("telescope.builtin").help_tags() end, desc = "[h]help" },
      { "<leader>tk", function() require("telescope.builtin").keymaps() end, desc = "[k]eymaps (normal)" },
      { "<leader>tt", function() require("telescope.builtin").filetypes() end, desc = "[f]iletypes" },
      { "<leader>tg", function() require("telescope.builtin").git_files() end, desc = "[g]it files" },
    },
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = require("telescope.themes").get_ivy({
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
				}),
			})
		end,
	}
}
