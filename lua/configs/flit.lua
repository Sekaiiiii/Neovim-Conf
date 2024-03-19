local status_ok, flit = pcall(require, "flit")
if not status_ok then
  vim.notify("Plugin Error: can't find flit plugin")
  return
end

require("flit").setup({
  keys = { f = "f", F = "F", t = "t", T = "T" },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  opts = {},
})
