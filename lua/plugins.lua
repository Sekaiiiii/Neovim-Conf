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
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("plugin-config.nvim-tree")
    end,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("plugin-config.auto-session")
    end,
  },
  {
    "glepnir/dashboard-nvim",
    config = function()
      require("plugin-config.dashboard")
    end,
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
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugin-config.null-ls")
    end,
  },
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
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugin-config.nvim-notify")
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("plugin-config.noice")
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    lazy = true,
    event = { "WinNew" },
    config = function()
      require("plugin-config.window-picker")
    end,
  },
}
local opts = {}

require("lazy").setup(plugins, opts)
