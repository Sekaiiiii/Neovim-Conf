local status_ok, windows = pcall(require, "windows")
if not status_ok then
	vim.notify("Plugin Error: can't find windows plugin")
	return
end

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

windows.setup({
	autowidth = {
		enable = false,
	},
	ignore = {
		buftype = { "quickfix", "NvimTree", "terminal" },
		filetype = {
			"Outline",
			"NvimTree",
			"neo-tree",
			"undotree",
			"gundo",
			"qf",
			"toggleterm",
			"TelescopePrompt",
			"alpha",
			"netrw",
		},
	},
})

local function cmd(command)
	return table.concat({ "<Cmd>", command, "<CR>" })
end

vim.keymap.set("n", "<C-w>z", cmd("WindowsMaximize"))
vim.keymap.set("n", "<c-w>_", cmd("WindowsMaximizeVertically"))
vim.keymap.set("n", "<c-w>|", cmd("WindowsMaximizeHorizontally"))
vim.keymap.set("n", "<c-w>=", cmd("WindowsEqualize"))
