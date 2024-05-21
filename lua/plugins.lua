local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    },
    config = function()
      require('plugin-config.nvim-tree')
    end
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("plugin-config.auto-session")
    end,
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugin-config.alpha")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugin-config.lualine")
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugin-config.bufferline")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugin-config.telescope")
    end,
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require("plugin-config.leap")
    end,
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require("plugin-config.flit")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugin-config.comment")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugin-config.toggleterm")
    end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("plugin-config.nvim-surround")
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugin-config.nvim-autopairs")
    end,
  },
  { "famiu/bufdelete.nvim" }, -- theme
  { "savq/melange-nvim" },
  { "folke/tokyonight.nvim" },
  { "projekt0n/github-nvim-theme" }, -- treesitter
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
      require("plugin-config.nvim-treesitter")
    end,
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("plugin-config.treesitter-context")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin-config.gitsigns")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    config = function()
      require("plugin-config.git-conflict")
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("plugin-config.diffview")
    end,
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "onsails/lspkind-nvim" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
      require("plugin-config.nvim-ufo")
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("plugin-config.symbols-outline")
    end,
  },
  {
    "folke/edgy.nvim",
    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,
    config = function()
      require("plugin-config.edgy")
    end,
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   config = function()
  --     require("plugin-config.nvim-notify")
  --   end,
  -- },
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   config = function()
  --     require("plugin-config.noice")
  --   end,
  -- },
  {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    event = { "WinNew" },
    config = function()
      require("plugin-config.window-picker")
    end,
  },
  {
    "anuvyklack/windows.nvim",
    lazy = true,
    cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
    dependencies = {
      "anuvyklack/middleclass",
    },
    config = function()
      require("plugin-config.windows")
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
        }
      })
    end
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
      require("goto-preview").setup({
        width = 120,
        height = 25,
        default_mappings = true,
        debug = false,
        opacity = nil,
        post_open_hook = nil,
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit",
          "gitrebase",
          "svn",
          "hgcommit",
        },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "kevinhwang91/nvim-bqf",
    -- quickfix preview and other functions
    lazy = true,
    event = { "WinNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        auto_resize_height = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
          should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then
              -- skip file size greater than 100k
              ret = false
            elseif bufname:match("^fugitive://") then
              -- skip fugitive buffer
              ret = false
            end
            return ret
          end,
        },
        func_map = {
          drop = "o",
          openc = "O",
          split = "<C-s>",
          tabdrop = "<C-t>",
          tabc = "",
          vsplit = "<C-v>",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "chentoast/marks.nvim",
    lazy = true,
    event = { "User FileOpened" },
    config = function()
      require("marks").setup({
        default_mappings = true,
        -- builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
        excluded_filetypes = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        },
        bookmark_0 = {
          sign = "",
          virt_text = "hello world",
          annotate = false,
        },
        mappings = {},
      })
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = require('plugin-config.whick-key')
  },
{
  'stevearc/conform.nvim',
  event = "VeryLazy",
   opts = {},
		config= function()require("plugin-config.conform") end
}
	}


local opts = {}

require("lazy").setup(plugins, opts)
