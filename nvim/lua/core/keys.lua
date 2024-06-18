-- Utility function to set key mappings
local function map(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- Normal mode
map('n', '<C-h>', '<C-w>h', 'Go to left window')
map('n', '<C-j>', '<C-w>j', 'Go to down window')
map('n', '<C-k>', '<C-w>k', 'Go to up window')
map('n', '<C-l>', '<C-w>l', 'Go to right window')

map('n', '<C-Left>', '<C-w><S-h>', 'Move window to the left')
map('n', '<C-Down>', '<C-w><S-j>', 'Move window to down')
map('n', '<C-Up>', '<C-w><S-k>', 'Move window to up')
map('n', '<C-Right>', '<C-w><S-l>', 'Move window to the right')

map('n', '<S-Up>', ':resize +2<CR>', 'Resize up')
map('n', '<S-Down>', ':resize -2<CR>', 'Resize down')
map('n', '<S-Left>', ':vertical resize +2<CR>', 'Resize left')
map('n', '<S-Right>', ':vertical resize -2<CR>', 'Resize right')

map('n', '<TAB>', ':bnext<CR>', 'Next buffer')
map('n', '<S-TAB>', ':bprevious<CR>', 'Previous buffer')

-- Terminal mode
map('t', '<Esc>', '<C-\\><C-n>', 'Escape terminal')
