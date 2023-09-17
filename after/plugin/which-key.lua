vim.g.mapleader = ","
vim.g.maplocalleader = " "

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

function GrepInputString()
	local cword = vim.api.nvim_eval([[expand("<cword>")]])
	require("telescope.builtin").live_grep({ default_text = cword })
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
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<leader>"] = ",",
		["<localleader>"] = "SPC",
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
	["n"] = {
		"nzz",
		"Find next and center on screen",
	},
	["N"] = {
		"Nzz",
		"Find previous and center on screen",
	},
	["Y"] = {
		"y$",
		"Yank from cursor to end of line like `D`",
	},
	["J"] = {
		"mzJ`z",
		"Join lines keeping cursor in its original position"
	},
	["<M-\\>"] = {
		":TagbarToggle<CR>",
		"Ctags Explorer",
	},
	["<C-\\>"] = {
		":NvimTreeToggle<CR>",
		"Toggle File Explorer",
	},
	["<C-p>"] = {
		[[<cmd>lua require('telescope.builtin').find_files()<CR>]],
		"Fuzzy File Finder",
	},
	["<C-u>"] = {"<C-u>zz", "Page Up keeping cursor in the middle"},
	["<C-d>"] = {"<C-d>zz", "Page Down keeping cursor in the middle"},
	["<M-p>"] = {
		[[<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'} })<cr>]],
		"NeoVim Config Finder",
	},
	g = {
		l = {
			[[:Telescope diagnostics<CR>]],
			"Diagnostics List",
		},
	},
	["<leader>"] = {
		a = { "<cmd>lua GrepInputString()<CR>", "Grep Files" },
		g = {
			name = "Git Fugitive",
			s = { ":G<CR>", "Git status" },
			d = { ":G diff<CR>", "Git diff" },
			f = { ":G fetch<CR>", "Git fetch" },
			b = { ":G blame<CR>", "Git blame" },
			p = { ":G push<CR>", "Git push" },
		},
		t = { ":tabnew<CR>", "New tab" },
		[","] = { ":tabnext<CR>", "Next tab" },
		["."] = { ":tabprevious<CR>", "Previous tab" },
		T = { ":tabclose<CR>", "Close tab" },
		V = { ":vnew<CR>", "New vertical Split" },
		X = { ":new<CR>", "New horizontal Split" },
		l = { ":set list!<CR>", "Toggle invisible characters" },
		w = { [[:%s/\s\+$//<cr>:let @/=''<CR>]], "Delete trailing spaces" },
	},
	["<localleader>"] = {
		["<localleader>"] = {
			":WhichKey<CR>",
			"Open WhichKey",
		},
		u = { ":MundoToggle<CR>", "Undo Visualization"},
		s = { ":set spell!<CR>", "Toggle spellcheck"},
		t = {
			name = "Terraform Providers",
			-- Use Ctrl-d to select a document
			l = {
				[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{}<cr>]],
				"Official Provider List",
			},
			c = {
				[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'cloudflare/cloudflare'}<cr>]],
				"Cloudflare Provider",
			},
			a = {
				[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/aws'}<cr>]],
				"AWS Provider",
			},
			g = {
				[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'integrations/github'}<cr>]],
				"Github Provider",
			},
			v = {
				[[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/vault'}<cr>]],
				"Vault Provider",
			},
		},
		b = {
			name = "Buffer Operations",
			d = { ":Bdelete<CR>", "Delete buffer preserving layout" },
			D = { ":bdelete<CR>", "Delete buffer" },
			w = { ":Bwipeout<CR>", "Wipe buffer preserving layout" },
		},
		C = { ":ToggleTerm direction=float<CR>", "Open a floating terminal" },
		c = { ":ToggleTerm direction=horizontal<CR>", "Open a floating terminal" },
		r = {
			name = "Rest plugin",
			r = { "<Plug>RestNvim", "Curl line under cursor" },
			p = { "<Plug>RestNvimPreview", "Preview Curl command" },
		},
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
	["<"] = {
		"<gv",
		"Reduce identation and remain in visual mode",
	},
	[">"] = {
		">gv",
		"Increase identation and remain in visual mode",
	},
	J = {":m '>+1<CR>gv=gv", "Move selected lines down"},
	K = {":m '<-2<CR>gv=gv", "Move selected lines down"},
}, visual_opts)

local insert_opts = {
	mode = "i",
	prefix = "",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

wk.register({
	["<C-c>"] = {
		"<Esc>",
		"When exiting visual block mode with Ctrl-C, changes are normally lost. Using <Esc> keeps the changes."
	}
}, insert_opts)
