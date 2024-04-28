return {
	{
		"NvChad/nvim-colorizer.lua",
		enabled = false,
		-- event = "User FilePost",
		-- opts = { user_default_options = { names = false } },
		-- config = function(_, opts)
		-- 	require("colorizer").setup(opts)
		--
		-- 	-- execute colorizer as soon as possible
		-- 	vim.defer_fn(function()
		-- 		require("colorizer").attach_to_buffer(0)
		-- 	end, 0)
		-- end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
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
