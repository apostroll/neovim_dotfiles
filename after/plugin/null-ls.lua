require("mason-null-ls").setup({
	ensure_installed = {
		-- Opt to list sources here, when available in mason.
		-- Linters
		"ruff", -- python
		"sqlfluff", -- SQL
		"shellcheck", -- shell
		"tflint", -- terraform

		-- Formatters
		"jq", -- json
		"shfmt", -- shell
		"stylua", -- lua
	},
	automatic_installation = false,
	handlers = {},
})
require("null-ls").setup({
	sources = {
		-- Anything not supported by mason.
	}
})
