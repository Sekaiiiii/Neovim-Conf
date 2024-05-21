local defaultPlugins = {
	"nvim-lua/plenary.nvim",
	-- formatting!
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
		config = function(_, opts)
			require("conform").setup(opts)
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = function()
			return require("nvchad.configs.treesitter")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "syntax")
			dofile(vim.g.base46_cache .. "treesitter")
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- git stuff
	{
		"lewis6991/gitsigns.nvim",
		event = "User FilePost",
		opts = function()
			return require("nvchad.configs.gitsigns")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "git")
			require("gitsigns").setup(opts)
		end,
	},

	-- lsp stuff
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		opts = function()
			return require("nvchad.configs.mason")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "mason")
			require("mason").setup(opts)

			-- custom nvchad cmd to install all mason binaries listed
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})

			vim.g.mason_binaries_list = opts.ensure_installed
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "User FilePost",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
		end,
	},

	-- load luasnips + cmp related in insert mode only
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require("nvchad.configs.luasnip")
				end,
			},

			-- autopairing of (){}[] etc
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},

			-- cmp sources plugins
			{
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-nvim-lua",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
		},
		opts = function()
			return require("nvchad.configs.cmp")
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},

	{
		"numToStr/Comment.nvim",
		keys = {
			{ "gcc", mode = "n", desc = "comment toggle current line" },
			{ "gc", mode = { "n", "o" }, desc = "comment toggle linewise" },
			{ "gc", mode = "x", desc = "comment toggle linewise (visual)" },
			{ "gbc", mode = "n", desc = "comment toggle current block" },
			{ "gb", mode = { "n", "o" }, desc = "comment toggle blockwise" },
			{ "gb", mode = "x", desc = "comment toggle blockwise (visual)" },
		},
		config = function(_, opts)
			require("Comment").setup(opts)
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			return require("nvchad.configs.telescope")
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "telescope")
			local telescope = require("telescope")
			telescope.setup(opts)

			-- load extensions
			for _, ext in ipairs(opts.extensions_list) do
				telescope.load_extension(ext)
			end
		end,
	},
	{
		"NvChad/base46",
		branch = "v2.5",
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"NvChad/ui",
		branch = "v2.5",
		lazy = false,
		config = function()
			require("nvchad")
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "User FilePost",
		opts = { user_default_options = { names = false } },
		config = function(_, opts)
			require("colorizer").setup(opts)
			-- execute colorizer as soon as possible
			vim.defer_fn(function()
				require("colorizer").attach_to_buffer(0)
			end, 0)
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = function()
			return { override = require("nvchad.icons.devicons") }
		end,
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "devicons")
			require("nvim-web-devicons").setup(opts)
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "User FilePost",
		opts = {
			indent = { char = "│", highlight = "IblChar" },
			scope = { char = "│", highlight = "IblScopeChar" },
		},
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "blankline")

			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
			require("ibl").setup(opts)

			dofile(vim.g.base46_cache .. "blankline")
		end,
	},
	{
		"folke/which-key.nvim",
		keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
		cmd = "WhichKey",
		config = function(_, opts)
			dofile(vim.g.base46_cache .. "whichkey")
			require("which-key").setup(opts)
		end,
	},
}

local userPlugins = {
	{
		"rafcamlet/nvim-luapad",
		lazy = true,
		cmd = { "Lua", "LuaRun", "Luapad" },
		config = function()
			require("configs.luapad")
		end,
	},
	{
		"folke/neodev.nvim",
		lazy = false,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform-config")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeClose" },
		config = function()
			require("configs.nvim-tree")
		end,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		config = function()
			require("configs.auto-session")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("configs.telescope")
		end,
	},
	{
		"ggandor/leap.nvim",
		lazy = false,
		config = function()
			require("configs.leap")
		end,
	},
	{
		"ggandor/flit.nvim",
		lazy = false,
		config = function()
			require("configs.flit")
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("configs.nvim-surround")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("configs.nvim-treesitter")
		end,
	},
	{
		"romgrk/nvim-treesitter-context",
		config = function()
			require("configs.treesitter-context")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		config = function()
			require("configs.git-conflict")
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		config = function()
			require("configs.diffview")
		end,
	},
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig" },
	{ "neovim/nvim-lspconfig" },
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		lazy = false,
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("configs.nvim-ufo")
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		lazy = true,
		cmd = { "SymbolsOutlineOpen", "SymbolsOutlineClose", "SymbolsOutline" },
		config = function()
			require("configs.symbols-outline")
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		lazy = true,
		event = { "WinNew" },
		config = function()
			require("configs.window-picker")
		end,
	},
	{
		"anuvyklack/windows.nvim",
		lazy = true,
		keys = { "<C-w>=", "<C-w>z" },
		cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
		dependencies = {
			"anuvyklack/middleclass",
		},
		config = function()
			require("configs.windows")
		end,
	},
	{
		"nathom/filetype.nvim",
		lazy = true,
		event = { "BufRead", "BufNewFile" },
		config = function()
			require("filetype").setup({
				overrides = {
					extensions = {
						h = "cpp",
					},
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"windwp/nvim-spectre",
		lazy = true,
		cmd = { "Spectre" },
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "TroubleToggle", "Trouble", "TroubleRefresh" },
		config = function()
			require("trouble").setup()
		end,
	},
	{
		"rmagatti/goto-preview",
		lazy = true,
		keys = { "gp" },
		config = function()
			require("configs.goto-preview")
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("configs.lastplace")
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		-- quickfix preview and other functions
		lazy = true,
		event = { "WinNew" },
		config = function()
			require("configs.nvim-bqf")
		end,
	},
	{
		"chentoast/marks.nvim",
		lazy = true,
		event = { "User FileOpened" },
		config = function()
			require("configs.marks")
		end,
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		config = function()
			require("configs.edgy")
		end,
	},
	{
		"windwp/nvim-spectre",
		lazy = true,
		cmd = { "Spectre" },
		config = function()
			require("spectre").setup()
		end,
	},
	{
		"roobert/search-replace.nvim",
		lazy = true,
		cmd = {
			"SearchReplaceSingleBufferVisualSelection",
			"SearchReplaceWithinVisualSelection",
			"SearchReplaceWithinVisualSelectionCWord",
			"SearchReplaceSingleBufferSelections",
			"SearchReplaceSingleBufferCWord",
			"SearchReplaceSingleBufferCWORD",
			"SearchReplaceSingleBufferCExpr",
			"SearchReplaceSingleBufferCFile",
			"SearchReplaceMultiBufferSelections",
			"SearchReplaceMultiBufferOpen",
			"SearchReplaceMultiBufferCWord",
			"SearchReplaceMultiBufferCWORD",
			"SearchReplaceMultiBufferCExpr",
			"SearchReplaceMultiBufferCFile",
		},
		config = function()
			require("search-replace").setup({
				default_replace_single_buffer_options = "gcI",
				default_replace_multi_buffer_options = "egcI",
			})
		end,
	},
	{
		"LeonHeidelbach/trailblazer.nvim",
		lazy = true,
		keys = { "<A-s>", "<A-d>" },
		config = function()
			-- local HOME = os.getenv("HOME")
			require("trailblazer").setup({
				auto_save_trailblazer_state_on_exit = false,
				auto_load_trailblazer_state_on_enter = false,
				-- custom_session_storage_dir = HOME .. "/.local/share/trail_blazer_sessions/",
				trail_options = {
					mark_symbol = "•", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
					newest_mark_symbol = "󰝥", -- disable this mark symbol by setting its value to ""
					cursor_mark_symbol = "󰺕", -- disable this mark symbol by setting its value to ""
					next_mark_symbol = "󰬦", -- disable this mark symbol by setting its value to ""
					previous_mark_symbol = "󰬬", -- disable this mark symbol by setting its value to ""
				},
				mappings = {
					nv = {
						motions = {
							new_trail_mark = "<A-s>",
							track_back = "<A-d>",
							peek_move_next_down = "<A-J>",
							peek_move_previous_up = "<A-K>",
							move_to_nearest = "<A-n>",
							toggle_trail_mark_list = "<A-o>",
						},
						actions = {
							delete_all_trail_marks = "<A-L>",
							paste_at_last_trail_mark = "<A-p>",
							paste_at_all_trail_marks = "<A-P>",
							set_trail_mark_select_mode = "<A-t>",
							switch_to_next_trail_mark_stack = "<A-.>",
							switch_to_previous_trail_mark_stack = "<A-,>",
							set_trail_mark_stack_sort_mode = "<A-S>",
						},
					},
				},
				quickfix_mappings = { -- rename this to "force_quickfix_mappings" to completely override default mappings and not merge with them
					-- nv = {
					-- 	motions = {
					-- 		qf_motion_move_trail_mark_stack_cursor = "<CR>",
					-- 	},
					-- 	actions = {
					-- 		qf_action_delete_trail_mark_selection = "d",
					-- 		qf_action_save_visual_selection_start_line = "v",
					-- 	},
					-- 	alt_actions = {
					-- 		qf_action_save_visual_selection_start_line = "V",
					-- 	},
					-- },
					-- v = {
					-- 	actions = {
					-- 		qf_action_move_selected_trail_marks_down = "<C-j>",
					-- 		qf_action_move_selected_trail_marks_up = "<C-k>",
					-- 	},
					-- },
				},
			})
		end,
	},
}

return _G.concatArray(defaultPlugins, userPlugins)
