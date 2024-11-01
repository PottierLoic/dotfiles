return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"folke/which-key.nvim", -- For mappings
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

		local ok_whichkey, whichkey = pcall(require, "which-key")
		if not ok_whichkey then
			print("Which-key not found")
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

		-- Keymaps
		local on_attach = function(_, bufnr)
			local lmap = function(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
			end

			-- Docs
			lmap("<leader>lh", vim.lsp.buf.hover, "[h]over")
			lmap("<leader>ls", vim.lsp.buf.signature_help, "[s]ignature")

			-- Move
			whichkey.register({
				["<leader>lg"] = {
					name = "[g]oto",
				},
			})
			lmap("<leader>lgd", vim.lsp.buf.definition, "[d]efinition")
			lmap("<leader>lgD", vim.lsp.buf.declaration, "[D]eclaration")
			lmap("<leader>lgi", vim.lsp.buf.implementation, "[i]mplementation")
			lmap("<leader>lgr", vim.lsp.buf.references, "[r]eferences")
			lmap("<leader>lgt", vim.lsp.buf.type_definition, "[t]ype definition")

			-- Workspace
			whichkey.register({
				["<leader>lw"] = {
					name = "[w]orkspace",
				},
			})
			lmap("<leader>lwa", vim.lsp.buf.add_workspace_folder, "[a]dd")
			lmap("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "[r]emove")
			lmap("<leader>lwl", vim.lsp.buf.list_workspace_folders, "[l]ist")

			-- Diagnostics
			lmap("<leader>do", vim.diagnostic.open_float, "[o]pen")
			lmap("<leader>dp", vim.diagnostic.goto_prev, "[p]revious")
			lmap("<leader>dn", vim.diagnostic.goto_next, "[n]ext")
			lmap("<leader>dl", vim.diagnostic.setloclist, "[l]ist")

			-- Actions
			lmap("<leader>ca", vim.lsp.buf.code_action, "[a]ction")
			lmap("<leader>lr", vim.lsp.buf.rename, "[r]ename")
			lmap("<leader>lf", vim.lsp.buf.format, "[f]ormat")
		end

		-- Capabilities
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		-- Default Mason config
		require("mason-lspconfig").setup_handlers({
			function(lsp_server)
				lsp[lsp_server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
		})
	end,
}
