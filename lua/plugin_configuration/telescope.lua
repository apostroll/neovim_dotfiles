local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('terraform_doc')

local actions = require "telescope.actions"

local previewers = require('telescope.previewers')

telescope.setup {
	defaults = {
		layout_config = {
			width = 0.75,
			prompt_position = "top",
			preview_cutoff = 120,
			horizontal = {mirror = false},
			vertical = {mirror = false}
		},
		prompt_prefix = " ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		file_sorter = require'telescope.sorters'.get_fuzzy_file,
		file_ignore_patterns = {},
		generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
		path_display = {},
		winblend = 0,
		border = {},
		borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
		color_devicons = true,
		use_less = true,
		set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		buffer_previewer_maker = previewers.buffer_previewer_maker,
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default + actions.center
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
			}
		}
	},
	extensions = {
		terraform_doc = {
			-- Can't get this to work. Not that I much care
			url_open_command = "/usr/bin/xdg-open",
			latest_provider_symbol = "  ",
			-- Opens to a vertical split using <C-d>
			wincmd = "botright vnew",
			wrap = "nowrap",
		}
	}

}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap(
  'n',
  '<C-p>',
  [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
  opts
)

keymap(
  'n',
  '<M-p>',
  [[<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'} })<cr>]],
  opts
)

keymap(
  'n',
  '<leader>a',
  [[<cmd>lua require('telescope.builtin').live_grep{}<cr>]],
  opts
)

keymap(
	'n',
	'<localleader>tf',
	[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{}<cr>]],
	opts
)
keymap(
	'n',
	'<localleader>cf',
	[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'cloudflare/cloudflare'}<cr>]],
	opts
)
keymap(
	'n',
	'<localleader>aws',
	[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/aws'}<cr>]],
	opts
)
