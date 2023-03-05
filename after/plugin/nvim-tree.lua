local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local api = require("nvim-tree.api")

local M = {}

M.on_attach = function(bufnr)
	local opts = function(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	vim.keymap.set("n", "s", api.node.open.vertical, opts("Open: Vertical Split"))
end

nvim_tree.setup({
	on_attach = M.on_attach,
	filters = {
		dotfiles = true,
	},
})
