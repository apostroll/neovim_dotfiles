local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local diagnostics = {
	'diagnostics',
	sources = { 'nvim_diagnostic', 'nvim_lsp' },
	sections = { 'error', 'warn' },
	symbols = { error = ' ', warn = ' ' },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local branch = {
	'branch',
	icons_enabled = true,
	icon = '',
}

local spaces = function()
	local identation
	if vim.api.nvim_buf_get_option(0, 'expandtab') then
		identation = 'spaces'
	else
		identation = 'tab'
	end
	return identation .. ': ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < 'x'
		for id, comp in ipairs(section) do
			if type(comp) ~= 'table' then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = '' } or { left = '' }
		end
	end
	return sections
end

local function mixed_indent()
	local space_pat = [[\v^ +]]
	local tab_pat = [[\v^\t+]]
	local space_indent = vim.fn.search(space_pat, 'nwc')
	local tab_indent = vim.fn.search(tab_pat, 'nwc')
	local mixed = (space_indent > 0 and tab_indent > 0)
	local mixed_same_line
	if not mixed then
		mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], 'nwc')
		mixed = mixed_same_line > 0
	end
	if not mixed then return '' end
	if mixed_same_line ~= nil and mixed_same_line > 0 then
		return 'Mixed Indent:' .. mixed_same_line
	end
	local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
	local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
	if space_indent_cnt > tab_indent_cnt then
		return 'Mixed Indent:' .. tab_indent
	else
		return 'Mixed Indent:' .. space_indent
	end
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '',
		section_separators = { left = '', right = '' },
		disabled_filetypes = { 'dashboard', 'NvimTree', 'Outline' },
	},
	sections = process_sections({
		lualine_a = { 'mode' },
		lualine_b = { branch, 'diff' },
		lualine_c = {
			{ 'filename', path = 2, files_status = true }
		},
		lualine_x = { mixed_indent },
		lualine_y = { 'filetype', 'encoding', 'fileformat' },
		lualine_z = { diagnostics, spaces },
	}),
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { 'quickfix' }

})
