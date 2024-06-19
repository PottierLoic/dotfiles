return {
	-- Snippets
	{ "rafamadriz/friendly-snippets" },
	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").load({})
		end,
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		version = false,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			vim.opt.pumheight = 10
			cmp.setup({
				completion = {
					completeopt = "menu,menuone",
				},

				-- Snippet engine
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				-- Keys
				mapping = cmp.mapping.preset.insert({
					["<C-e>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<TAB>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),

				-- Setup sources
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Import from lsp
					{ name = "luasnip" }, -- Luasnip completion
				}, {
					{ name = "buffer" },
				}),
			})
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
				matching = { dissalow_symbol_nonprefix_matching = false },
			})
		end,
	},
	{ "saadparwaiz1/cmp_luasnip" },
	-- Auto pair
	{
		"echasnovski/mini.pairs",
		config = function()
			require("mini.pairs").setup()
		end,
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
	-- move/indent lines
	{
		"echasnovski/mini.move",
		config = function()
			require("mini.move").setup()
		end,
	},
}
