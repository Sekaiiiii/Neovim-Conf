local M = {
  config_path = vim.fn.stdpath("config"),

  keys = {
    leader_key = "\\",

    -- cmp
    cmp_complete = "<A-.>",
    cmp_abort = "<A-,>",
    cmp_confirm = "<CR>",
    cmp_scroll_doc_up = "<C-u>",
    cmp_scroll_doc_down = "<C-d>",
    cmp_select_prev_item = "<C-k>",
    cmp_select_next_item = "<C-j>",

    -- luasnip
    snip_jump_next = "<C-l>",
    snip_jump_prev = "<C-h>",
    snip_next_choice = "<C-j>",
    snip_prev_choice = "<C-k>",

    -- lsp
    lsp = {
      rename = "<A-r>",
      code_action = "<A-c>",
      format = "<A-f>",
      definition = "gd",
      references = "gr",
      hover = "gh",
      -- diagnostic
      open_flow = "gp",
      goto_next = "gj",
      goto_prev = "gk",
    },

    -- bufferLine
    bufferLine = {
      prev = "<A-h>",
      next = "<A-l>",
      close = "<leader>cc",
      close_left = "<leader>ch",
      close_right = "<leader>cl",
      close_other = "<leader>co",
      close_pick = "<leader>cp",
      pick = "<leader>p",
    },
  },
  nvimTree = {
    enable = true,
    menuToggle = "<leader>mt",
    menuOpen = "<leader>mo",
    menuClose = "<leader>mc",
    menuFind = "<leader>mf",
    menuRefresh = "<leader>mr",

    edit = { "o", "<2-LeftMouse>" },
    system_open = "<CR>",
    -- v分屏打开文件
    vsplit = "sv",
    -- h分屏打开文件
    split = "sh",
    -- toggle .gitignore (git enable)
    toggle_git_ignored = "i",
    -- Hide (dotfiles)
    toggle_dotfiles = ".",
    -- togglle custom config
    toggle_custom = "u",

    refresh = "R",
    -- 文件操作
    create = "a",
    remove = "d",
    rename = "r",
    cut = "x",
    copy = "c",
    paste = "p",
    copy_name = "y",
    copy_path = "Y",
    copy_absolute_path = "gy",
    toggle_file_info = "I",
    tabnew = "t",
    -- 进入下一级
    cd = "]",
    -- 进入上一级
    dir_up = "[",
  },
}

return M
