-- Default indentation options
local indent = 2
vim.o.expandtab = true -- Turn tab into space
vim.o.shiftwidth = indent -- Size of a Tab keypresss
vim.o.tabstop = indent -- Size of a tab
vim.o.smartindent = true -- Keep track of location

-- Default status line
local height = 2
vim.o.cmdheight = height
vim.o.laststatus = 2
vim.o.showcmd = true

-- Scroll size
local scroll = 8
vim.o.scrolloff = scroll

-- Handle hidden characters
vim.opt.list = true
vim.opt.listchars = {
  tab = "| ",
  trail = "·",
  extends = "…",
  precedes = "…",
}

-- UX / UI
vim.o.termguicolors = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.splitbelow = true
vim.o.splitright = true

-- Theme
local scheme = "catppuccin"
vim.o.bg = "dark"
vim.cmd.colorscheme(scheme)

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Clipboard
vim.o.clipboard = "unnamed,unnamedplus"

-- Specific languages config override
vim.g.rust_recommended_style = false
