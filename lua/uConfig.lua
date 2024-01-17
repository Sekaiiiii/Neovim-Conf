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
      close_all = "<leader>ca",
      close_left = "<leader>ch",
      close_right = "<leader>cl",
      close_other = "<leader>co",
      close_pick = "<leader>cp",
      move_next = "<leader>ml",
      move_prev = "<leader>mh",
      pick = "<leader>bp",
    },
  },
}

return M
