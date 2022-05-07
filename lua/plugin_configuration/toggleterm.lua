local status_ok, toggleterm = pcall(require, 'toggleterm')
if not status_ok then
	return
end

toggleterm.setup{
  shade_terminals = true,
  start_in_insert = true,
  persist_size = true,
  close_on_exit = true,
}
