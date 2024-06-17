return {
  {
    "catppuccin/nvim",
    name = "catppucin",
    priority = 10000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto",
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        integrations = {
          cmp = true,
          dashboard = true,
          indent_blankline = { enabled = true },
          neotree = true,
          noice = true,
          telescope = true,
          treesitter = true,

        }
      })
      vim.cmd.colorscheme("catppuccin")
    end
  }
}
