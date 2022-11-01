M = {}

M.lsp_keymaps = function(bufnr)
	local status_ok, wk = pcall(require, "which-key")
	if not status_ok then
		return
	end

	local opts = {
		mode = "n",
		prefix = "",
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = false,
	}

	wk.register({
		["g"] = {
			name = "Code Navigation",
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "GoTo Declaration" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "GoTo Definition" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "GoTo Implementation" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "GoTo References" },
			n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "GoTo Next Diagnostic" },
			p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "GoTo Previous Diagnostic" },
			a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions" },
		},
		["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show Documentation" },
		["<C-k>"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
		["<localleader>"] = {
			["d"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Floating Diagnostic" },
			["f"] = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format buffer" },
		},
	}, opts)
end

return M
