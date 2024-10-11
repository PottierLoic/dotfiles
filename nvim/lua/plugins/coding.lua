return {
	-- Snippets
	{ "rafamadriz/friendly-snippets" },
	-- Snippet Engine
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "InsertEnter",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				include = { "python", "rust", "c", "c++", "lua", "html" },
			})
		end,
	},
	-- vscode pictograms for cmp
	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init({
				mode = "symbol_text",
			})
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
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		config = function()
			vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			vim.opt.pumheight = 10
			cmp.setup({
				completion = {
					completeopt = "menu,menuone, noselect",
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

				-- VSCode pictograms
				formatting = {
					format = require("lspkind").cmp_format({ with_text = false, maxwidth = 50 }),
				},

				-- Setup sources
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- Import from lsp
					{ name = "luasnip" }, -- Luasnip completion
				}, {
					{ name = "buffer" },
				}),

				matching = {
					disallow_fuzzy_matching = true,
					disallow_fullfuzy_matching = true,
					disallow_partial_fuzzy_matching = true,
					disallow_partial_matching = true,
					disallow_prefix_unmatching = false,
				},
				experimental = {
					ghost_text = {
						hl_group = "CmpGhostText",
					},
				},
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
}
