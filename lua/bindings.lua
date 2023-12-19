-- Move to window using the <ctrl> hjkl keys
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = "Go to lower window" })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = "Go to upper window" })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })

-- Save shortcut
vim.api.nvim_set_keymap("i", "<C-s>", "<cmd>w<cr><esc>", { noremap = true, silent = true, desc = "Save file" })
vim.api.nvim_set_keymap("x", "<C-s>", "<cmd>w<cr><esc>", { noremap = true, silent = true, desc = "Save file" })
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<cr>", { noremap = true, silent = true, desc = "Save file" })
vim.api.nvim_set_keymap("s", "<C-s>", "<cmd>w<cr><esc>", { noremap = true, silent = true, desc = "Save file" })

-- Move line up and down mappings
vim.api.nvim_set_keymap("n", "<A-Up>", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
vim.api.nvim_set_keymap("n", "<A-Down>", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })

vim.api.nvim_set_keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move line up" })
vim.api.nvim_set_keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move line down" })

-- Duplicate line above and below mappings
vim.api.nvim_set_keymap("n", "<S-A-Up>", ":t .-1<CR>", { noremap = true, silent = true, desc = "Duplicate line above" })
vim.api.nvim_set_keymap("n", "<S-A-Down>", ":t .<CR>", { noremap = true, silent = true, desc = "Duplicate line below" })

vim.api.nvim_set_keymap("v", "<S-A-Up>", ":t '<-1<CR>gv", { noremap = true, silent = true, desc = "Duplicate selection above" })
vim.api.nvim_set_keymap("v", "<S-A-Down>", ":t '><CR>gv", { noremap = true, silent = true, desc = "Duplicate selection below" })

-- Close current buffer (to close actual tab)
vim.api.nvim_set_keymap("n", "<C-w>", "<Cmd>lua require('mini.bufremove').delete(vim.fn.bufnr(), false)<CR>", { noremap = true, silent = true, desc = "Close current buffer" })

-- ToggleTerm remap
vim.api.nvim_set_keymap('t', '<C-w>', [[<C-\><C-n><C-w>]], { noremap = true, silent = true, desc = "Close terminal" })

