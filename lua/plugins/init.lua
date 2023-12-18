return {
  -- Colorschemes
  { import = 'plugins.colorscheme' },

  -- Util
  { import = 'plugins.util' },

  -- UI
  { import = 'plugins.ui' },

  -- Main menu
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },

  -- Editor plugins
  {
    { import = 'plugins.editor' },
  }

}