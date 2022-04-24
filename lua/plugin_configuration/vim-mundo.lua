local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<F3>', ':MundoToggle<CR>', opts)
