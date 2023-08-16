local uConfig = require("uConfig")

local keys = uConfig.keys

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local map = vim.api.nvim_set_keymap

local opt = { noremap = true, silent = true }
local opts_remap = { remap = true, silent = true }
local opts_expr = { expr = true, silent = true }

vim.g.mapleader = keys.leader_key
vim.g.maplocalleader = keys.leader_key

-- windows control
keymap("n", "<leader>bd", "<cmd>bdelete! %<CR>")
keymap("n", "<leader>wc", "<cmd>close<CR>")
keymap("n", "<leader>wj", "<cmd>new<CR>")
keymap("n", "<leader>wl", "<cmd>vnew<CR>")
keymap("n", "<leader>ws", "<cmd>split<CR>")
keymap("n", "<leader>wvs", "<cmd>vsplit<CR>")

-- lsp format
keymap("n", "<A-f>", ":lua vim.lsp.buf.format()<CR>")

-- 插件快捷键
local pluginKeys = {}

-- lsp 回调函数快捷键设置
pluginKeys.lspOnAttach = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
end

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
