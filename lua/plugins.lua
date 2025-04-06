-- Automatically install lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

lazy.setup({
	-- colorschemes
	"ellisonleao/gruvbox.nvim",
	-- git undo tree visualization
	"simnalamburt/vim-mundo",
	-- exuberant ctags frontend
	"preservim/tagbar",
	-- vertically align text
	"godlygeek/tabular",
	-- vscode-like pictograms for neovim's lsp
	"onsails/lspkind-nvim",
	-- marks new/modified/deleted lines in buffer
	"lewis6991/gitsigns.nvim",
	-- compose html using css selector syntax
	"mattn/emmet-vim",
	-- helpers for puppet
	"rodjek/vim-puppet",
	"robbles/logstash.vim",
	{
		-- eyecandy with eyecandy dependencies
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		-- tree filesystem explorer
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		-- more eyecandy
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- terminal inside neovim
		"akinsho/toggleterm.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- Diagnostics
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			--[[ "jose-elias-alvarez/null-ls.nvim" , ]]
		},
	},
	{
		-- fuzzy finder
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ANGkeith/telescope-terraform-doc.nvim",
		},
	},
	{
		-- Display keymappings for plugins that support it
		"folke/which-key.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- generates syntax tree from sources used for better highlighting
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- Git on steroids :P
		"tpope/vim-fugitive",
		dependencies = {
			"tpope/vim-rhubarb",
		},
	},
	{
		-- live markdown preview
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		-- Highlight and find todo comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
})
