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
	},
	-- File tree on the left
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>eo", "<cmd>Neotree<CR>", desc = "[o]pen" },
			{ "<leader>ec", "<cmd>Neotree close<CR>", desc = "[c]lose" },
			{ "<leader>et", "<cmd>NeoTreeShowToggle<CR>", desc = "[t]oggle" },
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
	},
	-- Show changes since last commit
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
