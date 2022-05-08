local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path,
	}
	print 'Installing packer close and reopen Neovim...'
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end,
	},
}

-- Install your plugins here
return packer.startup({ function(use)
	use 'wbthomason/packer.nvim' -- Have packer manage itself
	use 'simnalamburt/vim-mundo' -- Provide visualization of vim's undo graph
	use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
	use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins
	use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
	use 'numToStr/Comment.nvim' -- Easily comment stuff

	use 'preservim/tagbar' -- Displays a class outline (needs exuberant ctags)

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
			{
				's1n7ax/nvim-window-picker',
				tag = '1.*',
			}
		}
	}


	use 'godlygeek/tabular' -- Adds Tabularize command to vertically align text
	use 'moll/vim-bbye' -- Preserves layout when closing buffers
	use 'nvim-lualine/lualine.nvim' -- eyecandy
	use 'akinsho/toggleterm.nvim' -- Use terminal in vim buffers
	use 'lewis6991/impatient.nvim' -- Improves loading times for lua files
	use 'lukas-reineke/indent-blankline.nvim' -- Provides identation guides
	use 'antoinemadec/FixCursorHold.nvim' -- This is needed to fix lsp doc highlight

	-- Colorschemes
	use 'tanvirtin/monokai.nvim'

	-- cmp plugins
	use 'hrsh7th/nvim-cmp' -- The completion plugin
	use 'hrsh7th/cmp-buffer' -- buffer completions
	use 'hrsh7th/cmp-path' -- path completions
	use 'hrsh7th/cmp-cmdline' -- cmdline completions
	use {
		'saadparwaiz1/cmp_luasnip', -- snippet completions
		requires = {
			'L3MON4D3/LuaSnip'
		}
	}
	use 'hrsh7th/cmp-nvim-lsp'

	-- LSP
	use {
		'neovim/nvim-lspconfig', -- enable LSP
		requires = {
			'simrat39/rust-tools.nvim', -- extra functionality over rust analyzer
			'creativenull/diagnosticls-configs-nvim', -- diagnosticls configuration for several linters
			'folke/which-key.nvim', -- handle LSP mappings using which-key
		}
	}
	use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
	use 'tamago324/nlsp-settings.nvim' -- language server settings defined in json for
	use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'ANGkeith/telescope-terraform-doc.nvim',
		}
	}

	-- HTTP client for nvim (Requires curl, jq)
	-- Also requires the following TreeSitter parsers: {http, json}
	use {
		'NTBBloodbath/rest.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	-- Display keymappings for plugins that support it
	use 'folke/which-key.nvim'


	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- Git
	use 'tpope/vim-fugitive'
	use 'lewis6991/gitsigns.nvim'

	-- HTML
	use {
		'mattn/emmet-vim',
		ft = { 'html', 'eruby', 'javascriptreact' }
	}

	use 'rodjek/vim-puppet'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end,
config = {
	compile_path = require('packer.util').join_paths(vim.fn.stdpath('config'), '.plugin', 'packer_compiled.lua'),
}
})
