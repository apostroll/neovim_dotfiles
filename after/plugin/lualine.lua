local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic", "nvim_lsp" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " ", info = "", hint = "" },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, "diff" },
		lualine_c = {
			{
				"filename",
				path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
				files_status = true, -- displays file status (readonly status, modified status)
			},
		},
		lualine_x = { diagnostics },
		lualine_y = { "filetype", "encoding", "fileformat" },
		lualine_z = { "progress", "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "quickfix" },
})
