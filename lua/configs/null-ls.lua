local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  vim.notify("Plugin Error: can't find null_ls plugin")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettier,
    formatting.stylua,
  },
})
