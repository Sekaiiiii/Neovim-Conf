local uConfig = require("uConfig")

local status, nvim_surround = pcall(require, "nvim-surround")
if not status then
  vim.notify("Plugin Error: can't find nvim_surround plugin")
  return
end

nvim_surround.setup({
  keymaps = {
    insert = "<C-g>e",
    insert_line = "<C-g>E",
    normal = "ye",
    normal_cur = "yee",
    normal_line = "yE",
    normal_cur_line = "yEE",
    visual = "E",
    visual_line = "gE",
    delete = "de",
    change = "ce",
    change_line = "cE",
  }
})
