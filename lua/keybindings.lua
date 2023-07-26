local uConfig = require("uConfig")

local keys = uConfig.keys

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- 本地变量
local map = vim.api.nvim_set_keymap

local opt = { noremap = true, silent = true }
local opts_remap = { remap = true, silent = true }
local opts_expr = { expr = true, silent = true }

vim.g.mapleader = keys.leader_key
vim.g.maplocalleader = keys.leader_key

-- lsp format
keymap("n", "<A-f>", ":lua vim.lsp.buf.format()<CR>")

-- 交换 $ 和 g_
-- keymap({ "v", "n" }, "$", "g_")
-- keymap({ "v", "n" }, "g_", "$")
-- 交换 0 和 _
-- keymap({ "v", "n" }, "0", "_")
-- keymap({ "v", "n" }, "_", "0")

-- 插件快捷键
local pluginKeys = {}
-- lsp 回调函数快捷键设置
-- pluginKeys.cmp = function(cmp)
--     return {
--         -- 上一个
--         ['<C-k>'] = cmp.mapping.select_prev_item(),
--         -- 下一个
--         ['<C-j>'] = cmp.mapping.select_next_item(),
--         -- 出现补全
--         ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
--         -- 取消
--         ['<A-,>'] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close()
--         }),
--         -- 确认
--         -- Accept currently selected item. If none selected, `select` first item.
--         -- Set `select` to `false` to only confirm explicitly selected items.
--         ['<CR>'] = cmp.mapping.confirm({
--             select = true,
--             behavior = cmp.ConfirmBehavior.Replace
--         }),
--         -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
--         ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'})
--     }
-- end

return pluginKeys

