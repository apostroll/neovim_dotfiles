local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup()
require("mason-lspconfig").setup({
	automatic_installation = true,
})

local opts = {
	on_attach = require("lsp.handlers").on_attach,
	capabilities = require("lsp.handlers").capabilities,
}

local lsp_config_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_status_ok then
	return
end

lspconfig.bashls.setup(opts)

local clangd_opts = require("lsp.settings.clangd")
lspconfig.clangd.setup(vim.tbl_deep_extend("force", opts, clangd_opts))

lspconfig.cssls.setup(opts)
lspconfig.html.setup(opts)
lspconfig.jedi_language_server.setup(opts)
lspconfig.pylsp.setup(opts)
lspconfig.jsonls.setup(opts)
lspconfig.ltex.setup(opts)
lspconfig.prosemd_lsp.setup(opts)
lspconfig.rust_analyzer.setup(opts)

lspconfig.sqlls.setup(opts)

local sumneko_opts = require("lsp.settings.sumneko_lua")
lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", opts, sumneko_opts))

lspconfig.sqlls.setup(opts)
lspconfig.terraformls.setup(opts)
lspconfig.tsserver.setup(opts)
lspconfig.vimls.setup(opts)
