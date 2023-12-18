return {
  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git explorer",
      },
    },
  },

  -- doest't work yet ...
  -- -- telescope / fzf
  -- {
  --   'nvim-telescope/telescope-fzf-native.nvim',
  --   build = 'make',
  --   enabled = vim.fn.executable("make") == 1,
  --   config = function()
  --     extensions = {
  --       fzf = {
  --         fuzzy = true,                    -- false will only do exact matching
  --         override_generic_sorter = true,  -- override the generic sorter
  --         override_file_sorter = true,     -- override the file sorter
  --         case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
  --                                         -- the default case_mode is "smart_case"
  --       }
  --     }
  --   end,
  -- }
}
