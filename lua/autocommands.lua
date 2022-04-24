vim.cmd [[
	augroup _spelling
		autocmd!
		autocmd FileType gitcommit,markdown setlocal wrap spell
	augroup end
	augroup _python
		autocmd!
		autocmd Filetype python setlocal expandtab
	augroup end
	augroup _rust
		autocmd!
		autocmd Filetype rust compiler cargo
		autocmd Filetype rust nnoremap <leader>m :make build<CR>
	augroup end
	augroup _remember_cursor
		autocmd!
		autocmd bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
	augroup end
	augroup _fugitive
		autocmd!
		autocmd BufReadPost fugitive://* set bufhidden=delete
	augroup end
]]
