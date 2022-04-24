local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local diagnostics = {
	'diagnostics',
	sources = { 'ale', 'nvim_lsp'},
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
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = '#f3f3f3', bg = '#f3f3f3' } })
    end
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


lualine.setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '',
		section_separators = { left = '', right = '' },
		disabled_filetypes = {'dashboard', 'NvimTree', 'Outline' },
	},
	sections = process_sections({
		lualine_a = { 'mode' },
		lualine_b = { branch, 'diff' },
		lualine_c = { 'filename' },
		lualine_x = {},
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
	extensions = {'quickfix'}

})
