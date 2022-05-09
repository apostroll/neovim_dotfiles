local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

local status_keymaps_ok, keymaps = pcall(require, 'lsp.keymaps')
if not status_keymaps_ok then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- formatting
		formatting.prettier.with({ extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' } }),
		formatting.black.with({ extra_args = { '--fast' } }),
		formatting.jq,
		formatting.rustfmt,
		formatting.sqlfluff,
		formatting.trim_whitespace,
		formatting.stylua,
		formatting.erb_lint,
		formatting.puppet_lint,
		formatting.shfmt,
		formatting.terrafmt,

		-- diagnostics
		diagnostics.luacheck.with({ extra_args = {'--globals', 'vim'}}),
		diagnostics.flake8,
		diagnostics.shellcheck,
		diagnostics.zsh,
		diagnostics.erb_lint,
		diagnostics.puppet_lint,

		-- code actions
		code_actions.shellcheck,
		code_actions.refactoring,
	},
	on_attach = function(client, bufnr)
		print(client.name)
		if client.name == 'null-ls' then
			keymaps.lsp_keymaps(bufnr)
		end
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end
	end
})
