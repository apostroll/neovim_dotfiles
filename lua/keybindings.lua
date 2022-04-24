local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Normal --
keymap('n', ';', ':', opts)
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
keymap('n', 'Y', 'y$', opts)
keymap('n', '<leader>t', ':tabnew<CR>', opts)
keymap('n', '<leader>T', ':tabclose<CR>', opts)
keymap('n', '<leader>,', ':tabnext<CR>', opts)
keymap('n', '<leader>.', ':tabprevious<CR>', opts)
keymap('n', '<leader>d', '<Plug>Tasklist', opts)
keymap('n', '<leader>l', ':set list!<CR>', opts)
keymap('n', '<leader>w', [[:%s/\s\+$//<cr>:let @/=''<CR>]], opts)
keymap('n', '<F9>', ':set spell!<CR>', opts)
keymap('n', '<C-n>', ':nohlsearch<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
-- keymap('v', '<A-j>', ':m .+1<CR>==', opts)
-- keymap('v', '<A-k>', ':m .-2<CR>==', opts)
-- keymap('v', 'p', ''_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap('x', 'J', ':move '>+1<CR>gv-gv', opts)
-- keymap('x', 'K', ':move '<-2<CR>gv-gv', opts)
-- keymap('x', '<A-j>', ':move '>+1<CR>gv-gv', opts)
-- keymap('x', '<A-k>', ':move '<-2<CR>gv-gv', opts)

-- Command Mode --
keymap('c', '<C-a>', '<Home>', opts)
keymap('c', '<C-e>', '<End>', opts)
