local status_ok, treesitter_context = pcall(require, "treesitter-context")
if not status_ok then
	vim.notify("Plugin Error: can't find treesitter-context plugin")
	return
end

require("treesitter-context").setup({
	enable = true,
	throttle = true,
	max_lines = 3,
	patterns = {
		default = {
			"class",
			"function",
			"method",
		},
	},
})
