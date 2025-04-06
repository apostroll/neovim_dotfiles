vim.lsp.config("*", {
	root_markers = { ".git" },
})

-- Pick one of the following three:
-- Enable diagnostings in virtual text at end of line.
-- vim.diagnostic.config({ virtual_text = true })

-- Enable inline diagnostics for the entire buffer.
-- vim.diagnostic.config({ virtual_lines = true })

-- Enable inline diagnostics for the current line only.
vim.diagnostic.config({ virtual_lines = { current_line = true } })

vim.lsp.enable("luals")
vim.lsp.enable("bash")
vim.lsp.enable("cssls")
vim.lsp.enable("gopls")
vim.lsp.enable("html")
vim.lsp.enable("jedi")
vim.lsp.enable("json")
vim.lsp.enable("prosemd")
vim.lsp.enable("puppet")
vim.lsp.enable("ruff")
vim.lsp.enable("rust")
vim.lsp.enable("terraform")
vim.lsp.enable("tflint")
vim.lsp.enable("yaml")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client == nil then
			return
		end
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		if
			not client:supports_method("textDocument/willSaveWaitUntil")
			and client:supports_method("textDocument/formatting")
			and vim.bo.filetype ~= "yaml"
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
