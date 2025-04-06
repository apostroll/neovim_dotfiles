return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = { ".clangd", ".compile_commands" },
	single_file_support = true,
	capabilities = {
		textDocument = {
			completion = {
				editsNearCursor = true,
			},
		},
		offsetEncoding = { "utf-8", "utf-16" },
	},
}
