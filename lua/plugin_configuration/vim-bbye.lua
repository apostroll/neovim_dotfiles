local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<localleader>bd', ':Bdelete<CR>', opts)
keymap('n', '<localleader>bD', ':bdelete<CR>', opts)
keymap('n', '<localleader>bw', ':Bwipeout<CR>', opts)

