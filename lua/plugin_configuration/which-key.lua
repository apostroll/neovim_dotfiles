vim.g.mapleader = ','
vim.g.maplocalleader = ' '

local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
	return
end

wk.setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = false,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		}
	},
	key_labels = {
		['<space>'] = "SPC",
		['<leader>'] = ',',
		['<localleader>'] = 'SPC',
	},

})

local opts = {
	mode = "n",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

wk.register({
	['n'] = {
		'nzz', 'Find next and center on screen'
	},
	['N'] = {
		'Nzz', 'Find previous and center on screen'
	},
	['Y'] = {
		'y$', 'Yank from cursor to end of line like `D`'
	},
	['<F3>'] = {
		':MundoToggle<CR>', 'Undo Visualization'
	},
	['<F2>'] = {
		':TagbarToggle<CR>', 'Ctags Explorer'
	},
	['<F9>'] = {
		':set spell!<CR>', 'Toggle spellcheck'
	},
	['<C-\\>'] = {
		':NeoTreeRevealToggle<CR>', 'Toggle File Explorer'
	},
	['<C-p>'] = {
		[[<cmd>lua require('telescope.builtin').find_files()<cr>]], 'Fuzzy File Finder'
	},
	['<M-p>'] = {
		[[<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'} })<cr>]], 'NeoVim Config Finder'
	},
	['<leader>'] = {
		a = { [[<cmd>lua require('telescope.builtin').live_grep{}<cr>]], 'Grep Files' },
		g = {
			name = 'Git Fugitive',
			s = { ':G<CR>', 'Git status' },
			d = { ':G diff<CR>', 'Git diff' },
			f = { ':G fetch<CR>', 'Git fetch' },
			b = { ':G blame<CR>', 'Git blame' },
			p = { ':G push<CR>', 'Git push' },
		},
		t = { ':tabnew<CR>', 'New tab' },
		[','] = { ':tabnext<CR>', 'Next tab' },
		['.'] = { ':tabprevious<CR>', 'Previous tab' },
		T = { ':tabclose<CR>', 'Close tab' },
		l = { ':set list!<CR>', 'Toggle invisible characters' },
		w = { [[:%s/\s\+$//<cr>:let @/=''<CR>]], 'Delete trailing spaces' },
	},
	['<localleader>'] = {
		['<localleader>'] = {
			':WhichKey<CR>', 'Open WhichKey'
		},
		t = {
			name = 'Terraform Providers',
			l = { [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{}<cr>]], 'Official Provider List' },
			c = { [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'cloudflare/cloudflare'}<cr>]], 'Cloudflare Provider' },
			a = { [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/aws'}<cr>]], 'AWS Provider' },
		},
		b = {
			name = 'Buffer Operations',
			d = { ':Bdelete<CR>', 'Delete buffer preserving layout' },
			D = { ':bdelete<CR>', 'Delete buffer' },
			w = { ':Bwipeout<CR>', 'Wipe buffer preserving layout' }
		},
		C = { ':ToggleTerm direction=float<CR>', 'Open a floating terminal' },
		c = { ':ToggleTerm direction=horizontal<CR>', 'Open a floating terminal' },
		r = {
			name = 'Rest plugin',
			r = { '<Plug>RestNvim', 'Curl line under cursor' },
			p = { '<Plug>RestNvimPreview', 'Preview Curl command' },
		}
	},
}, opts)

local visual_opts = {
	mode = "v",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

wk.register({
	['<'] = {
		'<gv', 'Reduce identation and remain in visual mode'
	},
	['>'] = {
		'>gv', 'Increase identation and remain in visual mode'
	},
}, visual_opts)
