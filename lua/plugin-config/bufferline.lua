local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("Plugin Error: can't find bufferline plugin")
  return
end

local uConfig = require("uConfig")
local uBufferLine = uConfig.keys.bufferLine

-- You need to be using termguicolors for this plugin to work, as it reads the hex gui color values of various highlight groups.
vim.opt.termguicolors = true

bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    diagnostics = "nvim_lsp",
    numbers = "ordinal",
    offsets = {
      {
        filetype = "NvimTree",
        text = " NvimTree",
        highlight = "Directory",
        text_align = "center",
      },
    },
  },
})

-- 左右Tab切换
keymap("n", uBufferLine.prev, ":BufferLineCyclePrev<CR>")
keymap("n", uBufferLine.next, ":BufferLineCycleNext<CR>")

-- "moll/vim-bbye" 关闭当前 buffer
keymap("n", uBufferLine.close, ":Bdelete!<CR>")

-- 关闭左/右侧标签页
keymap("n", uBufferLine.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", uBufferLine.close_right, ":BufferLineCloseRight<CR>")

-- 关闭其他标签页
keymap("n", uBufferLine.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")

-- 关闭选中标签页
keymap("n", uBufferLine.close_pick, ":BufferLinePickClose<CR>")

-- 选标签
keymap("n", uBufferLine.pick, ":BufferLinePick<CR>")

-- 快捷跳转
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>")
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>")
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>")
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>")
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>")
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>")
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>")
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>")
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>")
