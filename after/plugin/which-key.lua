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
	preset="modern", -- supported values: classic, modern, helix
	plugins = {
		marks = false,
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
			g = true,
		},
	},
})

wk.add({
	{
		mode = {"n"},
		-- Enchanchments
		{"J", "mzJ`z", desc="Join lines keeping cursor in its original position"}, {"n", "nzz", desc="Find next and center on screen"},
		{"N", "Nzz", desc="Find previous and center on screen"},
		{"Y", "y$", desc="Yank from cursor to end of line like `D`"},
		{"<C-u>", "<C-u>zz", desc="Page Up keeping cursor in the middle"},
		{"<C-d>", "<C-d>zz", desc="Page Down keeping cursor in the middle"},
		-- Terminal
		{"<leader>c", ":ToggleTerm direction=horizontal<CR>", desc="Open a floating terminal"},
		{"<leader>C", ":ToggleTerm direction=float<CR>", desc="Open a floating terminal"},
		-- Tabs
		{"<leader>t", ":tabnew<CR>", desc="New tab"},
		{"<leader>T", ":tabclose<CR>", desc="Close tab"},
		{"<leader>,", ":tabnext<CR>", desc="Next tab"},
		{"<leader>.", ":tabprevious<CR>", desc="Previous tab"},
		-- Files
		{"<localleader><localleader>", "<cmd>Telescope find_files<cr>", desc="find files"},
		{"<localleader>f", group="files"},
		{"<localleader>fa", "<cmd>lua GrepInputString()<CR>", desc = "grep word under cursor" },
		{"<localleader>ff", "<cmd>Telescope find_files<cr>", desc = "find files" },
		{"<localleader>fb", "<cmd>Telescope buffers<cr>", desc = "find opened buffers" },
		{"<localleader>fz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "find in current buffer" },
		{"<localleader>fg", "<cmd>Telescope live_grep<cr>", desc = "live grep" },
		-- Documentation
		{"<localleader>d", group="documentation"},
		{"<localleader>dd", "<cmd>WhichKey <CR>", desc = "whichkey all keymaps" },
		{"<localleader>dl", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{}<cr>]], desc="Terraform Official Providers"},
		{"<localleader>dc", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'cloudflare/cloudflare'}<cr>]], desc="Terrraform Cloudflare"},
		{"<localleader>dh", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/helm'}<cr>]], desc="Terrraform Helm"},
		{"<localleader>da", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/aws'}<cr>]], desc="Terraform AWS"},
		{"<localleader>dg", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'integrations/github'}<cr>]], desc="Terraform Github"},
		{"<localleader>dv", [[<cmd>lua require('telescope._extensions.terraform_doc.builtin').search{full_name = 'hashicorp/vault'}<cr>]], desc="Terraform Vault"},
		-- Buffers
		{"<localleader>b", group="buffers"},
		{"<localleader>bd", ":Bdelete<CR>", desc="Delete buffer preserving layout"},
		{"<localleader>bD", ":bdelete<CR>", desc="Delete buffer"},
		{"<localleader>bw", ":Bwipeout<CR>", desc="Wipe buffer preserving layout"},
		{"<localleader>bw", [[:%s/\s\+$//<cr>:let @/=''<CR>]], desc="Delete trailing spaces"},
		-- Git
		{"<localleader>g", group="git"},
		{"<localleader>gs", ":G<CR>", desc="Git status"},
		{"<localleader>ga", ":Gitsigns stage_hunk<CR>", desc="stage hunk"},
		{"<localleader>gd", ":G diff<CR>", desc="diff"},
		{"<localleader>gf", ":G fetch<CR>", desc="fetch"},
		{"<localleader>gb", ":G blame<CR>", desc="blame"},
		{"<localleader>gp", ":G push<CR>", desc="push"},
		-- Toggles
		{"<localleader>t", group="toggles"},
		{"<localleader>ta", ":TagbarToggle<CR>", desc="ctags explorer"},
		{"<localleader>td", ":Telescope diagnostics<CR>", desc="diagnostics"},
		{"<localleader>tt", ":NvimTreeToggle<CR>", desc="file tree"},
		{"<localleader>tu", ":MundoToggle<CR>", desc="undo visualization"},
		{"<localleader>tl", ":set list!<CR>", desc="invisible characters"},
		{"<localleader>ts", ":set spell!<CR>", desc="spellcheck"},
	},
	{
		mode = {"v"},
		-- Enchanchments
		{"<", "<gv", desc="Reduce identation and remain in visual mode"},
		{">", ">gv", desc="Increase identation and remain in visual mode"},
		{"J", ":m '>+1<CR>gv=gv", desc="Move selected lines down"},
		{"K", ":m '<-2<CR>gv=gv", desc="Move selected lines down"},
		-- Git
		{"<localleader>g", group="git"},
		{"<localleader>ga", ":Gitsigns stage_hunk<CR>", desc="stage hunk"},
	},
	{
		mode = {"i"},
		{"<C-c>", "<Esc>", desc="When exiting visual block mode with Ctrl-C, changes are normally lost. Using <Esc> keeps the changes."}
	}
})
