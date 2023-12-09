vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
})

vim.api.nvim_create_augroup("_spelling", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.api.nvim_set_option_value("wrap", true, { scope = "local" })
		vim.api.nvim_set_option_value("spell", true, { scope = "local" })
	end,
	group = "_spelling",
})

vim.api.nvim_create_augroup("_fugitive", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "fugitive://*",
	callback = function()
		vim.api.nvim_set_option_value("bufhidden", "delete", { scope = "local" })
	end,
	group = "_fugitive",
})

vim.api.nvim_create_augroup("_cmd_win", { clear = true })
vim.api.nvim_create_autocmd("CmdWinEnter", {
	callback = function()
		vim.keymap.del("n", "<CR>", { buffer = true })
	end,
	group = "_cmd_win",
})
