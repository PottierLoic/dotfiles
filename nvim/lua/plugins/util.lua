return {
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
