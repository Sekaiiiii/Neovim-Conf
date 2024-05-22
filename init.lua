-- 加载nvim_gui_shim.vim文件
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/nvim_gui_shim.vim')

-- lua全局util
require("util.global")

-- basic基础配置
require("basic")

-- plugin插件管理 
require("plugins")

-- auto加载
require("auto.setup")

-- theme加载
require("theme")

-- lsp加载
require("lsp.setup")

-- cmp加载
require("cmp.setup")

-- keybindings加载
require("keybindings")

-- gui初始化
require("gui")
