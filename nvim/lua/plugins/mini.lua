return {
  {
    'echasnovski/mini.pairs',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'echasnovski/mini.comment',
    config = function()
      require('mini.comment').setup()
    end
  },
  {
    'echasnovski/mini.cursorword', version = '*',
    config = function()
      require('mini.cursorword').setup()
    end
  },
  {
    'echasnovski/mini.move', version = '*',
    config = function()
      require('mini.move').setup()
    end
  }
}

