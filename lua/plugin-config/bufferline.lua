local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	vim.notify("Plugin Error: can't find bufferline plugin")
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		diagnostics = "nvim_lsp",
		style_preset = {
			bufferline.style_preset.no_italic,
			bufferline.style_preset.no_bold,
		},
		tab_size = 1,
		max_name_length = 30,
		numbers = function(opts)
			return string.format("%s", opts.ordinal)
		end,
		always_show_bufferline = true,
		indicator = {
			style = "none",
		},
		separator_style = { "|", "|" },
	},
})
