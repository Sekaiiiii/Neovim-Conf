-- load lsp ui config
require("lsp.ui")

local status_ok, mason = pcall(require, "mason")
if not status_ok then
  vim.notify("Plugin Error: can't find mason plugin")
  return
end

mason.setup({})

local status_ok, masonLspConfig = pcall(require, "mason-lspconfig")
if not status_ok then
  vim.notify("Plugin Error: can't find mason-lspconfig plugin")
  return
end

masonLspConfig.setup({
  ensure_installed = {
    "clangd",
    "html",
    "cssls",
    "vuels",
    "tsserver",
    "yamlls",
    "lemminx",
    "jsonls",
    "lua_ls",
    "eslint",
  },
  automatic_installation = false,
  handlers = nil,
})

local status_ok, lspConfig = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Plugin Error: can't find mason plugin")
  return
end

local serverConfigTable = {
  clangd = require("lsp.config.clangd"),
  html = require("lsp.config.html"),
  vuels = require("lsp.config.vuels"),
  tsserver = require("lsp.config.tsserver"),
  lemminx = require("lsp.config.lemminx"),
  jsonls = require("lsp.config.jsonls"),
  yamlls = require("lsp.config.yamlls"),
  lua_ls = require("lsp.config.lua_ls"),
}

for name, config in pairs(serverConfigTable) do
  if config ~= nil and type(config) == "table" then
    config.on_setup(lspConfig[name])
  else
    lspConfig[name].setup({})
  end
end
