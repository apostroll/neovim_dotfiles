-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities =
	vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local wk_ok, wk = pcall(require, "which-key")
		if not wk_ok then
			return
		end

		wk.add({
			{ "<localleader>c", group = "lsp" },
			{ "<localleader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Actions" },
			{ "<localleader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "GoTo Definition" },
			{ "<localleader>cD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "GoTo Declaration" },
			{ "<localleader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format buffer" },
			{ "<localleader>cF", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Floating Diagnostic" },
			{ "<localleader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "GoTo Implementation" },
			{ "<localleader>cK", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show Documentation" },
			{ "<localleader>cp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "GoTo Previous Diagnostic" },
			{ "<localleader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "GoTo References" },
			{ "<localleader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
			{ "<localleader>cn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "GoTo Next Diagnostic" },
		})
	end,
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"jedi_language_server",
		"jsonls",
		"lua_ls",
		"rust_analyzer",
		"terraformls",
	},
	handlers = {
		rust_analyzer = function()
			require("lspconfig").rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})
		end,
	},
})

local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = cmp.mapping.preset.insert({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Tab>"] = cmp.mapping.confirm({ select = true }),
	["<CR>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-u>"] = cmp.mapping.scroll_docs(-4),
	["<C-d>"] = cmp.mapping.scroll_docs(4),
})

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp_mappings,
	snippet = {
		expand = function(args)
			-- You need Neovim v0.10 to use vim.snippet
			vim.snippet.expand(args.body)
		end,
	},
})
