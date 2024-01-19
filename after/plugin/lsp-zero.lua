local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

lsp.preset("recommended")

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
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local wk_ok, wk = pcall(require, "which-key")
	if not wk_ok then
		return
	end

	local normal_opts = {
		mode = "n",
		prefix = "",
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = false,
	}

	wk.register({
		["<localleader>"] = {
			["c"] = {
				name = "Code Navigation",
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
				d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "GoTo Definition" },
				D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "GoTo Declaration" },
				f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
				F = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Floating Diagnostic" },
				i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "GoTo Implementation" },
				K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },
				p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "GoTo Previous Diagnostic" },
				r = { "<cmd>lua vim.lsp.buf.references()<CR>", "GoTo References" },
				s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
				n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "GoTo Next Diagnostic" },
			},
		},
	}, normal_opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"jedi_language_server",
		"jsonls",
		"lua_ls",
		"rust_analyzer",
		"sqlls",
		"terraformls",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
		end,
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

lsp.setup()
