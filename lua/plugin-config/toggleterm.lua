local status, toggleterm = pcall(require, "toggleterm")
if not status then
	vim.notify("Plugin Error: can't find toggleterm plugin")
	return
end

local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.25
		end
	end,
	on_create = function(term) end, -- function to run when the terminal is first created
	on_open = function(term) end, -- function to run when the terminal opens
	on_close = function(term) end, -- function to run when the terminal closes
	on_stdout = function(term, job, data, name) end, -- callback for processing output on stdout
	on_stderr = function(term, job, data, name) end, -- callback for processing output on stderr
	on_exit = function(term, job, data, name) end, -- function to run when terminal process exits
	hide_numbers = false, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
	shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	-- shading_factor = 0,                              -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
	start_in_insert = true,
	insert_mappings = false, -- whether or not the open mapping applies in insert mode
	terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	direction = "horizontal", -- 'horizontal' | 'tab' | 'float'
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell,
	auto_scroll = true, -- automatically scroll to the bottom on terminal output
	winbar = {
		enabled = true,
		name_formatter = function(term) --  term: Terminal
			return term.name
		end,
	},
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		Normal = {
			link = "Normal",
		},
		NormalFloat = {
			link = "Normal",
		},
	},
})

local gituiTerm = Terminal:new({
	cmd = "gitui",
	direction = "float",
	float_opts = {
		border = "single",
		width = math.floor(vim.o.columns * 0.8),
		height = math.floor(vim.o.lines * 0.9),
		zindex = 5,
	},
})

function toggleterm_gituiToggle()
	gituiTerm:toggle()
end

local normalTerm1 = Terminal:new({
	displayname = "normalTerm1",
	direction = "horizontal",
	dir = vim.fn.getcwd(),
})

local normalTerm2 = Terminal:new({
	displayname = "normalTerm2",
	direction = "horizontal",
	dir = vim.fn.getcwd(),
})

local normalTerm3 = Terminal:new({
	displayname = "normalTerm3",
	direction = "horizontal",
	dir = vim.fn.getcwd(),
})

local normalTermTable = { normalTerm1, normalTerm2, normalTerm3 }

local M = {}

function M.toggleNormalTerm(index)
	local chooseTerm = normalTermTable[index]
	chooseTerm:toggle()
end

return M
