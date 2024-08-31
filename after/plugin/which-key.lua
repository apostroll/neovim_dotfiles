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
			operators = false,
			motions = false,
			text_objects = false,
			windows = false,
			nav = false,
			z = true,
			g = false,
		},
	},
	replace = {
		["<space>"] = "SPC",
		["<leader>"] = ",",
		["<localleader>"] = "SPC",
	},
})

wk.add({
	{
		mode = {"n"},
		{"J", "mzJ`z", desc="Join lines keeping cursor in its original position"},
		{"n", "nzz", desc="Find next and center on screen"},
		{"N", "Nzz", desc="Find previous and center on screen"},
		{"Y", "y$", desc="Yank from cursor to end of line like `D`"},
		{"<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]], desc="Fuzzy File Finder"},
		{"<M-p>", [[<cmd>lua require('telescope.builtin').find_files({search_dirs = {'~/.config/nvim'} })<cr>]], desc="NeoVim Config Finder"},
		{"<C-u>", "<C-u>zz", desc="Page Up keeping cursor in the middle"},
		{"<C-d>", "<C-d>zz", desc="Page Down keeping cursor in the middle"},
		{"gl", [[:Telescope diagnostics<CR>]], desc="Diagnostics List"},
		{"<leader>a", "<cmd>lua GrepInputString()<CR>", desc="Grep Files"},
		{"<leader>c", ":ToggleTerm direction=horizontal<CR>", desc="Open a floating terminal"},
		{"<leader>C", ":ToggleTerm direction=float<CR>", desc="Open a floating terminal"},
		{"<leader>g", group="git"},
		{"<leader>gs", ":G<CR>", desc="Git status"},
		{"<leader>gd", ":G diff<CR>", desc="Git diff"},
		{"<leader>gf", ":G fetch<CR>", desc="Git fetch"},
		{"<leader>gb", ":G blame<CR>", desc="Git blame"},
		{"<leader>gp", ":G push<CR>", desc="Git push"},
		{"<leader>l", ":set list!<CR>", desc="Toggle invisible characters"},
		{"<leader>s", ":set spell!<CR>", desc="Toggle spellcheck"},
		{"<leader>t", ":tabnew<CR>", desc="New tab"},
		{"<leader>T", ":tabclose<CR>", desc="Close tab"},
		{"<leader>,", ":tabnext<CR>", desc="Next tab"},
		{"<leader>.", ":tabprevious<CR>", desc="Previous tab"},
		{"<M-\\>", ":TagbarToggle<CR>", desc="Ctags Explorer"},
		{"<C-\\>", ":NvimTreeToggle<CR>", desc="Toggle File Explorer"},
		{"<leader>u", ":MundoToggle<CR>", desc="Undo Visualization"},
		{"<leader>V", ":vnew<CR>", desc="New vertical Split"},
		{"<leader>X", ":new<CR>", desc="New horizontal Split"},
		{"<leader>w", [[:%s/\s\+$//<cr>:let @/=''<CR>]], desc="Delete trailing spaces"},
		{"<localleader><localleader>", ":WhichKey<CR>", desc="Open WhichKey"},
		{"<localleader>t", group="terraform"},
		{"<localleader>tl", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{}<cr>]], desc="Official Providers"},
		{"<localleader>tc", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'cloudflare/cloudflare'}<cr>]], desc="Cloudflare"},
		{"<localleader>ta", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/aws'}<cr>]], desc="AWS"},
		{"<localleader>tg", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'integrations/github'}<cr>]], desc="Github"},
		{"<localleader>tv", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/vault'}<cr>]], desc="Vault"},
		{"<localleader>b", group="buffers"},
		{"<localleader>bd", ":Bdelete<CR>", desc="Delete buffer preserving layout"},
		{"<localleader>bD", ":bdelete<CR>", desc="Delete buffer"},
		{"<localleader>bw", ":Bwipeout<CR>", desc="Wipe buffer preserving layout"},
		{"<localleader>rr", "<Plug>RestNvim", desc="Curl line under cursor"},
		{"<localleader>rp", "<Plug>RestNvimPreview", desc="Preview Curl command"},
	},
	{
		mode = {"v"},
		{"<", "<gv", desc="Reduce identation and remain in visual mode"},
		{">", ">gv", desc="Increase identation and remain in visual mode"},
		{"J", ":m '>+1<CR>gv=gv", desc="Move selected lines down"},
		{"K", ":m '<-2<CR>gv=gv", desc="Move selected lines down"},
	},
	{
		mode = {"i"},
		{"<C-c>", "<Esc>", desc="When exiting visual block mode with Ctrl-C, changes are normally lost. Using <Esc> keeps the changes."}
	}
})
