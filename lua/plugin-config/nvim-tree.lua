local uConfig = require("uConfig")
local uTree = uConfig.nvimTree

if uTree == nil or not uTree.enable then return end

local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("Plugin Error: can't find nvim-tree plugin")
    return
end

keymap("n", uTree.toggle, ":NvimTreeToggle<CR>")

nvim_tree.setup({})
