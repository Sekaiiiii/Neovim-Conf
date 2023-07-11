local uConfig = require("uConfig")

local status, nvim_surround = pcall(require, "nvim_surround")
if not status then
  vim.notify("Plugin Error: can't find nvim_surround plugin")
  return
end

nvim_surround.setup({})
