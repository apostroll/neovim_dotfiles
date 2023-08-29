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
	"tanvirtin/monokai.nvim",
	"ellisonleao/gruvbox.nvim",
	-- git undo tree visualization
	"simnalamburt/vim-mundo",
	-- exuberant ctags frontend
	"preservim/tagbar",
	-- vertically align text
	"godlygeek/tabular",
	-- Preserves layout when closing buffers  (see: :Bdelete, :Bwipeout)
	"moll/vim-bbye",
	-- vscode-like pictograms for neovim's lsp
	"onsails/lspkind-nvim",
	-- Snippet thingy I'm not using
	"L3MON4D3/LuaSnip",
	-- simple to use language server installer
	"williamboman/mason.nvim",
	-- bridges mason.nvim with the lspconfig plugin
	"williamboman/mason-lspconfig.nvim",
	-- Configures Language Server Protocol (LSP) servers
	"neovim/nvim-lspconfig",
	-- extra functionality over rust analyzer
	"simrat39/rust-tools.nvim",
	-- language server settings defined in json for
	"tamago324/nlsp-settings.nvim",
	-- marks new/modified/deleted lines in buffer
	"lewis6991/gitsigns.nvim",
	-- compose html using css selector syntax
	"mattn/emmet-vim",
	-- helpers for puppet
	"rodjek/vim-puppet",
	{
		-- Autopairs, integrates with both cmp and treesitter
		"windwp/nvim-autopairs",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		-- The completion plugin
		"hrsh7th/nvim-cmp",
		dependencies = {
			-- nvim-cmp source for buffer words
			"hrsh7th/cmp-buffer",
			-- nvim-cmp source for neovim's built-in LSP
			"hrsh7th/cmp-nvim-lsp",
		},
	},
	{
		-- Easily comment stuff
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	},
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
		-- language server that runs formatters and linters found in $PATH
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		pin = true, -- plugin archived. No further updates.
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
		-- HTTP client for nvim (Requires curl, jq)
		"NTBBloodbath/rest.nvim",
		-- Also requires the following TreeSitter parsers: {http, json}
		dependencies = {
			"nvim-lua/plenary.nvim",
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
})
