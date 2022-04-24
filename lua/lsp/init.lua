local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

require 'lsp.lsp-installer'
require('lsp.handlers').setup()
require 'lsp.null-ls'

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<localleader>ff', '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', opts)
