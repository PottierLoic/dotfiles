-- Extra plugins that have no particular utility except I like them
return {
	{
		"IogaMaster/neocord",
		event = "VeryLazy",
		config = function()
			require("neocord").setup()
		end,
	},
	{
		"dstein64/vim-startuptime",
    cmd = "StartupTime",
	},
}
