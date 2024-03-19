local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Plugin Error: can't find nvim-treesitter plugin")
  return
end

local formattedTextCorrlation = { "json", "yaml" }
local gitCorrlation = { "gitignore", "gitcommit", "git_config", "git_rebase" }
local frontEndCorrlation = {
  "html",
  "css",
  "scss",
  "vue",
  "javascript",
  "tsx",
  "jsdoc",
}
local backEndCorrlation = { "sql", "bash" }
local pythonCorrlation = { "python" }
local luaCorrlation = { "lua" }
local markdownCorrlation = { "markdown" }
local dockerCorrlation = { "dockerfile" }
local otherCorrlation = { "markdown_inline", "regex" }

local ensure_install_array = _G.concatArray(
  formattedTextCorrlation,
  gitCorrlation,
  frontEndCorrlation,
  backEndCorrlation,
  luaCorrlation,
  pythonCorrlation,
  markdownCorrlation,
  dockerCorrlation,
  otherCorrlation
)
treesitter.setup({
  ensure_installed = ensure_install_array,
  auto_install = false,
  sync_install = false,
  -- 启用代码高亮模块
  highlight = { enable = true },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>", -- set to `false` to disable one of the mappings
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>",
    },
  },
  -- 启用代码缩进模块 (=)
  indent = { enable = true },
  -- https://github.com/windwp/nvim-ts-autotag
  autotag = { enable = true },
  -- nvim-treesitter/nvim-treesitter-refactor
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
  },
  -- nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
    swap = {
      enable = false,
      swap_next = { ["<leader>a"] = "@parameter.inner" },
      swap_previous = { ["<leader>A"] = "@parameter.inner" },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})
