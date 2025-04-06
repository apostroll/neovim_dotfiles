local root_markers = {
	"manifests",
	".puppet-lint.rc",
	"hiera.yaml",
	".git",
}

return {
	cmd = { "puppet-languageserver", "--stdio" },
	filetypes = { "puppet" },
	root_markers = root_markers,
	single_file_support = true,
}
