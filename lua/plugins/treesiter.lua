return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      auto_install = true,
      ensure_installed = {
        "json",
        "yaml",
        "html",
        "css",
        "javascript",
        "typescript",
        "bash",
        "python",
        "lua",
        "c",
        "cpp",
        "rust",
        "v"
      },
      highlight = {
        enable = true,
        use_languagetree = true
      },
      indent = {
        enable = true,
        disable = {},
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },
}
