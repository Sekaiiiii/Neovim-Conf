local status_ok, masonLspConfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Plugin Error: can't find mason-lspconfig plugin")
  return
end

masonLspConfig.setup({
  ensure_installed = {
    'clangd', 'html', 'cssls', 'vuels', 'tsserver', 'yamlls', 'lemminx',
    'jsonls', 'lua_ls', 'eslint'
  },
  automatic_installation = true,
  handlers = nil
})
