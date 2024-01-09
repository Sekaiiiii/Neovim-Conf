local status_ok, notify = pcall(require, "notify")
if not status_ok then
  vim.notify("Plugin Error: can't find notify plugin")
  return
end

vim.notify = require("notify")
