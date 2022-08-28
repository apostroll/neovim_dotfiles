local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return
end

toggleterm.setup {
	shade_terminals = true,
	start_in_insert = true,
	persist_size = true,
	close_on_exit = true,
}

function _G.set_terminal_keymaps()
	vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { buffer = 0 })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
