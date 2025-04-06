require("mason").setup({})
require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
		-- Linters
		"ruff", -- python
		"shellcheck", -- shell
		"tflint", -- terraform

		-- Formatters
		"jq", -- json
		"shfmt", -- shell
	},
	methods = {
		diagnostics = true,
		formatting = true,
		code_actions = true,
		completion = true,
		hover = true,
	},
	automatic_installation = false,
	handlers = {},
})
require("null-ls").setup({
	sources = {
		-- Anything not supported by mason.
	},
})
