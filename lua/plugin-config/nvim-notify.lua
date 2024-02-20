local status_ok, notify = pcall(require, "notify")
if not status_ok then
  require("telescope").extensions.notify.notify()
  require("telescope").extensions.notify.notify()
  vim.notify("Plugin Error: can't find notify plugin")
  return
end

vim.notify = require("notify").setup({
  background_colounr = "Normal",
  render = "compact",
  timeout = 1000,
  fps = 1,
  stages = "static",
  max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
  max_height = math.floor(vim.api.nvim_win_get_width(0) / 2),
})

vim.cmd("highlight NotifyERRORBorder guifg=#8A1F1F")
vim.cmd("highlight NotifyWARNBorder guifg=#79491D")
vim.cmd("highlight NotifyINFOBorder guifg=#4F6752")
vim.cmd("highlight NotifyDEBUGBorder guifg=#8B8B8B")
vim.cmd("highlight NotifyTRACEBorder guifg=#4F3552")
vim.cmd("highlight NotifyERRORIcon guifg=#F70067")
vim.cmd("highlight NotifyWARNIcon guifg=#F79000")
vim.cmd("highlight NotifyINFOIcon guifg=#A9FF68")
vim.cmd("highlight NotifyDEBUGIcon guifg=#8B8B8B")
vim.cmd("highlight NotifyTRACEIcon guifg=#D484FF")
vim.cmd("highlight NotifyERRORTitle  guifg=#F70067")
vim.cmd("highlight NotifyWARNTitle guifg=#F79000")
vim.cmd("highlight NotifyINFOTitle guifg=#A9FF68")
vim.cmd("highlight NotifyDEBUGTitle  guifg=#8B8B8B")
vim.cmd("highlight NotifyTRACETitle  guifg=#D484FF")
vim.cmd("highlight link NotifyERRORBody Normal")
vim.cmd("highlight link NotifyWARNBody Normal")
vim.cmd("highlight link NotifyINFOBody Normal")
vim.cmd("highlight link NotifyDEBUGBody Normal")
vim.cmd("highlight link NotifyTRACEBody Normal")

vim.keymap.set("n", "<leader>fn", function()
  require("telescope").extensions.notify.notify()
end)
