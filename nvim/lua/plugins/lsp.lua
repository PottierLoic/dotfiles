return {
	"neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"folke/neodev.nvim",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = function()
        require("mason").setup()
      end,
    },
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"rust_analyzer",
						"clangd",
						"markdown_oxide",
					},
				})
			end,
		},
	},

	config = function()
		local ok_lsp, lsp = pcall(require, "lspconfig")
		if not ok_lsp then
			vim.notify("lspconfig nor found", vim.log.levels.ERROR)
			return
		end

		local ok_neodev, neodev = pcall(require, "neodev")
		if ok_neodev then
			neodev.setup()
		end

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

		-- Diagnostics configuration
		local config = 

		vim.diagnostic.config({
      virtual_text = true,
	    signs = true,
		  update_in_insert = true,
		})

		-- Default Mason config
		require("mason-lspconfig").setup_handlers({
			function(lsp_server)
				lsp[lsp_server].setup({})
			end,
		})
	end,
}
