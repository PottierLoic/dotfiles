return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/neodev.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"rust_analyzer",
						"clangd",
						"markdown_oxide",
						"ocamllsp",
					},
				})
			end,
			dependencies = {
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup()
				end,
			},
		},
	},

	config = function()
		local ok_lsp, lsp = pcall(require, "lspconfig")
		if not ok_lsp then
			print("Lspconfig not found")
			return
		end

		local ok_neodev, neodev = pcall(require, "neodev")
		if not ok_neodev then
			print("Neodev not found")
			return
		end

		-- Add Neovim lua elements for configuration writting
		neodev.setup()

		-- Diagnostic signs
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = "",
			Information = " ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Diagnostics config
		local config = {
			virtual_text = true, -- Disable virtual text
			signs = true, -- Display signs
			update_in_insert = true, -- In insert mode, doesn't display errors
		}

		vim.diagnostic.config(config)

		-- Capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Default Mason config
		require("mason-lspconfig").setup_handlers({
			function(lsp_server)
				lsp[lsp_server].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
