local status_ok, wdi = pcall(require, "nvim-web-devicons")
if not status_ok then
	return
end

wdi.setup({
	override = {},
	default = true, -- globally enable default icons (default to false)
})
