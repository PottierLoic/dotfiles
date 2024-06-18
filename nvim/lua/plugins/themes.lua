return {
  { 'folke/tokyonight.nvim' },
  { 'rebelot/kanagawa.nvim' },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function()
      require("catppuccin").setup({
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
  },
  { 'nyoom-engineering/oxocarbon.nvim' },
}
