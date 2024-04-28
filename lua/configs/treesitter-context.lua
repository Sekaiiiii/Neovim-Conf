local status_ok, treesitter_context = pcall(require, "treesitter-context")
if not status_ok then
	vim.notify("Plugin Error: can't find treesitter-context plugin")
	return
end

treesitter_context.setup({
	enable = false,
	throttle = true,
	max_lines = 0,
	patterns = {
		default = {
			"class",
			"function",
			"method",
		},
	},
})
