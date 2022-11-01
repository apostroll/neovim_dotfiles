local status_ok, monokai = pcall(require, "monokai")
if not status_ok then
	return
end

monokai.setup({ palette = monokai.soda })
vim.opt["background"] = "dark"
