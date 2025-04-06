local root_markers = {
	"pyproject.toml",
	"setup.py",
	"setup.cfg",
	"requirements.txt",
	"Pipfile",
	".git",
}

return {
	cmd = { "jedi-language-server" },
	filetypes = { "python" },
	root_markers = root_markers,
	single_file_support = true,
}
