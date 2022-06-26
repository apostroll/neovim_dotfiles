local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end

local opts = {
	tools = { -- rust-tools options
		autoSetHints = true,
		hover_with_actions = true,
		inlay_hints = {
			only_current_line = false,
			show_parameter_hints = true,
			parameter_hints_prefix = "<- ",
			other_hints_prefix = "=> ",
			max_len_align = true,
		},
	},
	server = {
		standalone = true,
	}
}

rust_tools.setup(opts)
