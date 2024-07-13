local status_ok, edgy = pcall(require, "edgy")
if not status_ok then
	vim.notify("Plugin Error: can't find edgy plugin")
	return
end

local actual_opts = {
	options = { left = { size = 35 }, right = { size = 35 } },
	icons = {
		closed = "  ",
		open = "   ",
	},
	wo = {
		-- Setting to `true`, will add an edgy winbar.
		-- Setting to `false`, won't set any winbar.
		-- Setting to a string, will set the winbar to that string.
		winbar = false,
		winfixwidth = false,
		winfixheight = false,
		winhighlight = "WinBar:EdgyWinBar,Normal:Normal",
		spell = false,
		signcolumn = "no",
	},
	animate = { enabled = false },
	exit_when_last = true,
	close_when_all_hidden = true,
	bottom = {
		{
			ft = "toggleterm",
			size = { height = 15 },
		},
		"Trouble",
		{ ft = "quickfix", title = "QuickFix" },
	},
	right = {
		{
			ft = "help",
			size = { width = 100 },
			filter = function(buf)
				return vim.bo[buf].buftype == "help"
			end,
		},
		{
			ft = "Outline",
			open = "SymbolsOutlineOpen",
		},
	},
}

edgy.setup(actual_opts)
