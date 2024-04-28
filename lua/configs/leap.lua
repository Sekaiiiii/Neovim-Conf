local status_ok, leap = pcall(require, "leap")
if not status_ok then
	vim.notify("Plugin Error: can't find leap plugin")
	return
end

vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward-to)")
vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward-to)")
vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)")
