vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ftMap = {
  vim = "indent",
  python = { "indent" },
  git = "",
}

require("ufo").setup({
  open_fold_hl_timeout = 150,
  close_fold_kinds = { "imports", "comment" },
  preview = {
    win_config = {
      border = { "", "─", "", "", "", "─", "", "" },
      winhighlight = "Normal:Folded",
      winblend = 0,
    },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      jumpTop = "[",
      jumpBot = "]",
    },
  },
  provider_selector = function(bufnr, filetype, buftype)
    -- if you prefer treesitter provider rather than lsp,
    -- return ftMap[filetype] or {'treesitter', 'indent'}
    return ftMap[filetype]
  end,
})


vim.keymap.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
    return;
  end
end)


-- return the max fold level of the buffer (for now doing the opposite and folding incrementally is unbounded)
-- Also jarring if yzu start folding incrementally after opening all folds
local function max_level()
  -- return vim.wo.foldlevel -- find a way for this to return max fold level
  return 0
end

---Set the fold level to the provided value and store it locally to the buffer
---@param num integer the fold level to set
local function set_fold(num)
  -- vim.w.ufo_foldlevel = math.min(math.max(0, num), max_level()) -- when max_level is implemneted properly
  vim.b.ufo_foldlevel = math.max(0, num)
  require("ufo").closeFoldsWith(vim.b.ufo_foldlevel)
end

---Shift the current fold level by the provided amount
---@param dir number positive or negative number to add to the current fold level to shift it
local shift_fold = function(dir) set_fold((vim.b.ufo_foldlevel or max_level()) + dir) end

-- when max_level is implemented properly
-- vim.keymap.set("n", "zR", function() set_win_fold(max_level()) end, { desc = "Open all folds" })
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })

vim.keymap.set("n", "zM", function() set_fold(0) end, { desc = "Close all folds" })

vim.keymap.set("n", "zr", function() shift_fold(vim.v.count == 0 and 1 or vim.v.count) end, { desc = "Fold less" })

vim.keymap.set("n", "zm", function() shift_fold(-(vim.v.count == 0 and 1 or vim.v.count)) end, { desc = "Fold more" })
