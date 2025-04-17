return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
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
      indent = {
        enabled = true,
        animate = {
          enabled = false,
        },
      },
      notifier = { enabled = true },
      words = { enabled = true },
    },
  },
  -- Comment
	{
		"echasnovski/mini.comment",
    event = "VeryLazy",
		config = function()
			require("mini.comment").setup()
		end,
	},
	-- Highlight word under cursor
	{
		"echasnovski/mini.cursorword",
    event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("mini.cursorword").setup()
		end,
	},
}
