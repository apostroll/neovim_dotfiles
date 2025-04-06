return {
	cmd = { "tflint", "--langserver" },
	filetypes = { "terraform" },
	root_markers = { ".terraform", "terragrunt.hcl", "root.hcl", ".git", ".tflint.hcl" },
}
