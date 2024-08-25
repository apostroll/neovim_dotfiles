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

lsp.on_attach(function(_, _)
	local wk_ok, wk = pcall(require, "which-key")
	if not wk_ok then
		return
	end

	wk.add({
		{"<localleader>c", group="lsp"},
		{"<localleader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc="Code Actions"},
		{"<localleader>cd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc="GoTo Definition"},
		{"<localleader>cD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc="GoTo Declaration"},
		{"<localleader>cf", "<cmd>lua vim.lsp.buf.format()<cr>", desc="Format buffer"},
		{"<localleader>cF", "<cmd>lua vim.diagnostic.open_float()<CR>", desc="Floating Diagnostic"},
		{"<localleader>ci", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc="GoTo Implementation"},
		{"<localleader>cK", "<cmd>lua vim.lsp.buf.hover()<CR>", desc="Show Documentation"},
		{"<localleader>cp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc="GoTo Previous Diagnostic"},
		{"<localleader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", desc="GoTo References"},
		{"<localleader>cs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc="Signature Help"},
		{"<localleader>cn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc="GoTo Next Diagnostic"},
	})
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
