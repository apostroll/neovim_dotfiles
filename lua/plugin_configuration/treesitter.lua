local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
	return
end

configs.setup {
	ensure_installed = {
		'html',
		'http',
		'css',
		'vim',
		'lua',
		'javascript',
		'python',
		'rust',
		'json',
		'toml',
		'make',
		'markdown',
		'query',
		'yaml',
		'cmake',
		'dockerfile',
		'haskell',
		'latex',
		'bash',
		'vim',
	},
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { '' },
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
		disable = { 'yaml' }
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = '<CR>',
			node_incremental = '<CR>',
			node_decremental = '<BS>',
			scope_incremental = '<TAB>',
		}
	},
}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- Don't collapse by default
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
