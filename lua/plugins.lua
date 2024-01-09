require("packer").startup({
	function(use)
		-- packer 插件管理
		use("wbthomason/packer.nvim")

		-- nvim-tree 文件管理
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})
		require("plugin-config.nvim-tree")

		-- auto-session 会话管理
		use({ "rmagatti/auto-session" })
		require("plugin-config.auto-session")

		-- lualine 底部状态栏
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
		})
		require("plugin-config.lualine")

		-- dashboard
		use({ "glepnir/dashboard-nvim" })
		require("plugin-config.dashboard")

		-- buffer line
		use({
			"akinsho/bufferline.nvim",
			tag = "*",
			requires = "nvim-tree/nvim-web-devicons",
		})
		require("plugin-config.bufferline")

		-- telescope
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.4",
			requires = { { "nvim-lua/plenary.nvim" } },
		})
		require("plugin-config.telescope")

		-- leap
		use({
			"ggandor/leap.nvim",
		})
		require("plugin-config.leap")

		-- flit
		use({
			"ggandor/flit.nvim",
		})
		require("plugin-config.flit")

		-- comment
		use({ "numToStr/Comment.nvim" })
		require("plugin-config.comment")

		-- nvim-toggleterm
		use({ "akinsho/toggleterm.nvim" })
		require("plugin-config.toggleterm")

		-- nvim-surround
		use({ "kylechui/nvim-surround" })
		require("plugin-config.nvim-surround")

		-- nvim-autopairs
		use({ "windwp/nvim-autopairs" })
		require("plugin-config.nvim-autopairs")

		-- buf delete
		use("famiu/bufdelete.nvim")

		-- color themes
		use("savq/melange-nvim")
		use("folke/tokyonight.nvim")
		use("projekt0n/github-nvim-theme")

		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			requires = {
				{ "p00f/nvim-ts-rainbow" },
				{ "JoosepAlviste/nvim-ts-context-commentstring" },
				{ "windwp/nvim-ts-autotag" },
				{ "nvim-treesitter/nvim-treesitter-refactor" },
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
			},
		})
		require("plugin-config.nvim-treesitter")

		use({
			"romgrk/nvim-treesitter-context",
		})
		require("plugin-config.treesitter-context")

		-- gitsigns
		use({ "lewis6991/gitsigns.nvim" })
		require("plugin-config.gitsigns")

		-- git-conflict
		use({ "akinsho/git-conflict.nvim", version = "*" })
		require("plugin-config.git-conflict")

		-- diffview
		use({ "sindrets/diffview.nvim" })
		require("plugin-config.diffview")

		-- lsp corrlation
		use({ "williamboman/mason.nvim" })
		use({ "williamboman/mason-lspconfig" })
		use({ "neovim/nvim-lspconfig" })

		-- nvim-cmp
		use({ "hrsh7th/cmp-nvim-lsp" }) -- { name = nvim_lsp }
		use({ "hrsh7th/cmp-buffer" }) -- { name = 'buffer' },
		use({ "hrsh7th/cmp-path" }) -- { name = 'path' }
		use({ "hrsh7th/cmp-cmdline" }) -- { name = 'cmdline' }
		use({ "hrsh7th/nvim-cmp" })

		-- vsnip
		use("hrsh7th/cmp-vsnip") -- { name = 'vsnip' }
		use("hrsh7th/vim-vsnip")
		use("L3MON4D3/LuaSnip")
		use("saadparwaiz1/cmp_luasnip")
		use("rafamadriz/friendly-snippets")

		-- lspkind
		use("onsails/lspkind-nvim")

		-- null-ls
		use("jose-elias-alvarez/null-ls.nvim")
		require("plugin-config.null-ls")

		-- nvim-ufo
		use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
		require("plugin-config.nvim-ufo")

		--symbol-outline
		use("simrat39/symbols-outline.nvim")
		require("plugin-config.symbols-outline")

		--edgy
		use({
			"folke/edgy.nvim",
			init = function()
				vim.opt.laststatus = 3
				vim.opt.splitkeep = "screen"
			end,
		})
		require("plugin-config.edgy")

		-- nvim-notify
		use("rcarriga/nvim-notify")
		require("plugin-config.nvim-notify")

		-- noice
		use({
			"folke/noice.nvim",
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
		})
		require("plugin-config.noice")
	end,
}, {
	git = {
		default_url_format = "git@github.com:%s",
	},
})
