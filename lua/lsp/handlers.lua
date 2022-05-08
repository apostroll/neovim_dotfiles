local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = 'DiagnosticSignError', text = '' },
		{ name = 'DiagnosticSignWarn', text = '' },
		{ name = 'DiagnosticSignHint', text = '' },
		{ name = 'DiagnosticSignInfo', text = '' },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		source = true,
		-- show signs
		signs = {
			active = signs,
		},
		-- update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = 'minimal',
			border = 'rounded',
			source = 'always',
			header = '',
			prefix = '',
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = 'rounded',
	})

	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = 'rounded',
	})
end

local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]],
			false
		)
	end
end

local function lsp_keymaps(bufnr)
	local status_ok, wk = pcall(require, 'which-key')
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
		['g'] = {
			name = 'Code Navigation',
			D = { '<cmd>lua vim.lsp.buf.declaration()<CR>', 'GoTo Declaration' },
			d = { '<cmd>lua vim.lsp.buf.definition()<CR>', 'GoTo Definition' },
			i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'GoTo Implementation' },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'GoTo References' },
			n = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'GoTo Next Diagnostic' },
			p = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'GoTo Previous Diagnostic' },
			l = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'GoTo Diagnostics List' },
			a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Actions' },
		},
		['K'] = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show Documentation' },
		['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
		['<localleader>'] = {
			['d'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Floating Diagnostic' },
			['f'] = { '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', 'Format buffer' },
		},
	}, opts)
end

M.on_attach = function(client, bufnr)
	if client.name == 'tsserver' then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
