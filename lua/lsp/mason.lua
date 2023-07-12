local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Plugin Error: can't find mason plugin")
  return
end

mason.setup({})
