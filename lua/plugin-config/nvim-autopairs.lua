local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("Plugin Error: can't find nvim_autopairs plugin")
  return
end

nvim_autopairs.setup({
  map_cr = true,
})
