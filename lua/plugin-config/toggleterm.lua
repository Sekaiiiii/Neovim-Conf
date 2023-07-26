local uConfig = require("uConfig")

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
  open_mapping = [[<leader>tt]],
  on_create = function(term) end,                 -- function to run when the terminal is first created
  on_open = function(term) end,                   -- function to run when the terminal opens
  on_close = function(term) end,                  -- function to run when the terminal closes
  on_stdout = function(term, job, data, name) end, -- callback for processing output on stdout
  on_stderr = function(term, job, data, name) end, -- callback for processing output on stderr
  on_exit = function(term, job, data, name) end,  -- function to run when terminal process exits
  hide_numbers = false,                           -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = true,                               -- when neovim changes it current directory the terminal will change it's own when next it's opened
  highlights = {
    Normal = {
      guibg = 0,
    },
    NormalFloat = {
      link = "Normal",
    },
    FloatBorder = {
      guifg = 0,
      guibg = 0,
    },
  },
  shade_terminals = true,   -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 0,       -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
  start_in_insert = true,
  insert_mappings = false,  -- whether or not the open mapping applies in insert mode
  terminal_mappings = false, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
  direction = "horizontal", -- 'horizontal' | 'tab' | 'float'
  close_on_exit = true,     -- close the terminal window when the process exits
  shell = vim.o.shell,
  auto_scroll = true,       -- automatically scroll to the bottom on terminal output
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end,
  },
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "single",
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.9),
    zindex = 5,
  },
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<ESC>", "<ESC>", { noremap = true, silent = true })
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tf", ":TermSelect<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tg", ":lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
-- keymap("n", "<leader>tn", ":lua newTerminal()<CR>")
