local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return
end

toggleterm.setup{
  open_mapping = [[<localleader>c]],
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap(
	'n',
	'<localleader>C',
	':ToggleTerm direction=float<CR>',
	opts
)
