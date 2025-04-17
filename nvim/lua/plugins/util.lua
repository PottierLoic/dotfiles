return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      terminal = { enabled = true },
      dashboard = {
        preset = {
          header = [[
██╗      ██████╗ ██╗   ██╗██╗███╗   ███╗
██║     ██╔═══██╗██║   ██║██║████╗ ████║
██║     ██║   ██║██║   ██║██║██╔████╔██║
██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
          ]],
        }
      },
      indent = { enabled = true },
      notifier = { enabled = true },
      words = { enabled = true },
    },
  },
  -- Comment
	{
		"echasnovski/mini.comment",
		config = function()
			require("mini.comment").setup()
		end,
	},
	-- Highlight word under cursor
	{
		"echasnovski/mini.cursorword",
		config = function()
			require("mini.cursorword").setup()
		end,
	},
}
