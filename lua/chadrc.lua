local M = {}

M.ui = {
	------------------------------- base46 -------------------------------------
	-- hl = highlights
	hl_add = {},
	hl_override = {},
	changed_themes = {},
	theme_toggle = { "aquarium", "aquarium" },
	theme = "aquarium", -- default theme
	transparency = true,

	cmp = {
		icons = true,
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
	},

	telescope = { style = "bordered" }, -- borderless / bordered

	------------------------------- nvchad_ui modules -----------------------------
	statusline = {
		theme = "vscode", -- default/vscode/vscode_colored/minimal
		-- default/round/block/arrow separators work only for default statusline theme
		-- round and block will work for minimal theme only
		separator_style = "default",
		order = nil,
		modules = nil,
	},

	-- lazyload it when there are 1+ buffers
	tabufline = {
		enabled = true,
		lazyload = false,
		order = { "buffers", "tabs", "btns" },
		modules = nil,
	},

	nvdash = {
		load_on_startup = true,

		header = {
			"           ▄ ▄                   ",
			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
		},

		buttons = {
			{ "󰈚 Dir: neovim conf", "", "cd " .. vim.fn.stdpath("config") },
			{ "󰈚 Dir: manage.web", "", "cd " .. "D:\\Code\\C110X0\\efs.manage.web" },
			{ "󰈚 Dir: manage.web.bak", "", "cd " .. "D:\\Code\\C110X0\\efs.manage.web.bak" },
			{ "󰈚 Dir: manage.web.bak1", "", "cd " .. "D:\\Code\\C110X0\\efs.manage.web.bak1" },
			{ "󰈚 Dir: biz.web", "", "cd " .. "D:\\Code\\C110X0\\efs.biz.web" },
			{ "󰈚 Dir: biz.web.bak", "", "cd " .. "D:\\Code\\C110X0\\efs.biz.web.bak" },
			{ "󰈚 Dir: biz.web.bak1", "", "cd " .. "D:\\Code\\C110X0\\efs.biz.web.bak1" },
			{ "󰈚 Dir: nginx", "", "cd " .. "D:\\nginx" },
			{ "󰈚 Dir: script", "", "cd " .. "D:\\Code\\script" },
		},
	},

	cheatsheet = { theme = "grid" }, -- simple/grid

	lsp = {
		signature = true,
		semantic_tokens = false,
	},

	term = {
		-- hl = "Normal:term,WinSeparator:WinSeparator",
		sizes = { sp = 0.3, vsp = 0.2 },
		float = {
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single",
		},
	},
}

M.base46 = {
	integrations = {
		"blankline",
		"cmp",
		"defaults",
		"devicons",
		"git",
		"lsp",
		"mason",
		"nvcheatsheet",
		"nvdash",
		"nvimtree",
		"statusline",
		"syntax",
		"treesitter",
		"tbline",
		"telescope",
		"whichkey",
	},
}

return M
