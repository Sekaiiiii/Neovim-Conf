local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  vim.notify("Plugin Error: can't find nvim-treesitter plugin")
  return
end

local formattedTextCorrlation = { "json", "yaml" }
local gitCorrlation = { "gitignore", "gitcommit", "git_config", "git_rebase" }
local frontEndCorrlation = {
  "html", "css", 'scss', 'vue', 'javascript', 'tsx', 'jsdoc'
}
local backEndCorrlation = { "sql", "bash" }
local pythonCorrlation = { "python" }
local luaCorrlation = { "lua" }
local markdownCorrlation = { "markdown" }
local dockerCorrlation = { "dockerfile" }

local ensure_install_array = _G.concatArray(formattedTextCorrlation,
  gitCorrlation, frontEndCorrlation,
  backEndCorrlation, luaCorrlation,
  pythonCorrlation,
  markdownCorrlation, dockerCorrlation);
treesitter.setup({
  ensure_installed = ensure_install_array,
  auto_install = true,
  sync_install = true,
  -- 启用代码高亮模块
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  -- 启用增量选择模块
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>", -- set to `false` to disable one of the mappings
      node_incremental = "<CR>",
      scope_incremental = "<TAB>",
      node_decremental = "<BS>"
    }
  },
  -- 启用代码缩进模块 (=)
  indent = { enable = true },
  -- p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true,   -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 10000, -- Do not enable for files with more than n lines, int
    colors = {
      "#95ca60", "#ee6985", "#D6A760", "#7794f4", "#b38bf5", "#7cc7fe"
    } -- table of hex strings
    -- termcolors = { } -- table of colour name strings
  },
  -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  context_commentstring = { enable = true, enable_autocmd = false },
  -- https://github.com/windwp/nvim-ts-autotag
  autotag = { enable = true },
  -- nvim-treesitter/nvim-treesitter-refactor
  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true
    },
    highlight_current_scope = { enable = false }
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
        ["ib"] = "@block.inner"
      }
    },
    swap = {
      enable = false,
      swap_next = { ["<leader>a"] = "@parameter.inner" },
      swap_previous = { ["<leader>A"] = "@parameter.inner" }
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer"
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer"
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer"
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer"
      }
    }
  }
})

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- 文件解析映射
local parser_mapping = require("nvim-treesitter.parsers").filetype_to_parsername

parser_mapping.xml = "html" -- map the html parser to be used when using xml files
parser_mapping.less = "css"
