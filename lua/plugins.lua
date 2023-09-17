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
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			-- Configures Language Server Protocol (LSP) servers (Required)
			{ "neovim/nvim-lspconfig" },
			-- simple to use language server installer (Optional)
			{ "williamboman/mason.nvim" },
			-- bridges mason.nvim with the lspconfig plugin (Optional)
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			-- The completion plugin (Required)
			{ "hrsh7th/nvim-cmp" },
			-- nvim-cmp source for neovim's built-in LSP (Required)
			{ "hrsh7th/cmp-nvim-lsp" },
			-- nvim-cmp source for buffer words (Optional)
			{ "hrsh7th/cmp-buffer" },
			-- Snippet thingy I'm not really using (Required)
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{
		-- Diagnostics
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim" ,
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
