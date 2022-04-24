local M = {}
local api = vim.api

function M.get_selection()
	local start_row = api.nvim_buf_get_mark(0, '<')[1] - 1
	local start_col = api.nvim_buf_get_mark(0, '<')[2]
	local end_col = api.nvim_buf_get_mark(0, '>')[2] + 1

	print(start_row, start_col .. '-'.. end_col)
	local text = api.nvim_buf_get_text(0, start_row, start_col, start_row, end_col, {})
	return text[1]
end

return M
