return {
  'zaldih/themery.nvim',
  config = function()
    require('themery').setup({
      themes = {
        {
          name = "Catppuccin Mocha",
          colorscheme = "catppuccin-mocha",
          before = [[
            require('catppuccin').setup({
              transparent_background = true,
            })
          ]],
        },
        {
          name = "Catppuccin Latte",
          colorscheme = "catppuccin-latte",
          before = [[
            require('catppuccin').setup({
              transparent_background = false,
            })
          ]],
        },
        {
          name = "Tokyonight Night",
          colorscheme = "tokyonight-night",
          before = [[
            require('tokyonight').setup({
              transparent_background = false,
            })
          ]],
        },
        {
          name = "Tokyonight Day",
          colorscheme = "tokyonight-day",
          before = [[
            require('tokyonight').setup({
              transparent_background = false,
            })
          ]],
        },
        {
          name = "Kanagawa Lotus",
          colorscheme = "kanagawa-lotus",
          before = [[
            require('kanagawa').setup({
              transparent_background = false,
            })
          ]],
        },
        {
          name = "Oxocarbon Dark",
          colorscheme = "oxocarbon",
          before = [[
            vim.opt.background = "dark"
          ]],
        },
        {
          name = "Oxocarbon Light",
          colorscheme = "oxocarbon",
          before = [[
            vim.opt.background = "light"
          ]],
        },
      },
      livePreview = true,
    })
  end
}
