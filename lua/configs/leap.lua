local status_ok, leap = pcall(require, "leap")
if not status_ok then
  vim.notify("Plugin Error: can't find leap plugin")
  return
end

require('leap').create_default_mappings()
