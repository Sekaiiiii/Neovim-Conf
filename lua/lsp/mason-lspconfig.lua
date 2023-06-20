local status_ok, masonLspConfig = pcall(require, "mason-lspconfig")
if not status_ok then
    vim.notify("Plugin Error: can't find mason-lspconfig plugin")
    return
end

-- local lspCorrlation = {
--     "html-lsp", "cssmodules-language-server", "typescript-language-server",
--     "vetur-vls", "json-lsp", "lua-language-server"
-- }

-- local dapCorrlation = {}
-- local linterCorrlation = {}
-- local formatterCorrlation = {
--     'luaformatter', 'htmlbeautifier', 'fixjson', 'standardjs'
-- }
-- local ensure_install_array = _G.concatArray(lspCorrlation, dapCorrlation,
--                                             linterCorrlation,
--                                             formatterCorrlation);

masonLspConfig.setup({
    ensure_installed = {
        'html', 'cssmodules_ls','cssls', 'tsserver', 'volar', 'yamlls', 'lemminx',
        'jsonls', 'lua_ls'
    },
    automatic_installation = true,
    handlers = nil
})
