return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  opts = {
    indent = {
      char = "|",
      tab_char = "|",
    },
    scope = { show_start = false, show_end = false },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end
}
