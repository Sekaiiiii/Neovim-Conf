local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local opts = {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    -- client.server_capabilities.document_formatting = false
    -- client.server_capabilities.document_range_formatting = false
  end,
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
