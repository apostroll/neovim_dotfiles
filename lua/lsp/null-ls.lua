local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		-- formatting
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.jq,
		formatting.rustfmt,
		formatting.sqlfluff,
		formatting.trim_whitespace,
		formatting.stylua,
		formatting.shfmt,
		formatting.terraform_fmt,
		formatting.gofmt,

		-- diagnostics
		diagnostics.luacheck.with({ extra_args = { "--globals", "vim" } }),
		diagnostics.flake8,
		diagnostics.djlint,
		diagnostics.shellcheck,
		diagnostics.zsh,
		diagnostics.golangci_lint,

		-- code actions
		code_actions.shellcheck,
		code_actions.refactoring,
	},
	on_attach = require("lsp.handlers").on_attach,
})
