require("notify").setup {
	background_colour = "#000000",
	fps = 30,
	icons = {
		DEBUG = "",
		ERROR = "",
		INFO = "",
		TRACE = "✎",
		WARN = ""
	},
	level = 2,
	minimum_width = 50,
	render = "default",
	time_formats = {
		notification = "%T",
		notification_history = "%FT%T"
	},
	timeout = 1000,
	top_down = true
}


vim.notify = require('notify')
