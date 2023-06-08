-- lua全局配置
require('util.global')

-- Packer插件管理
require("plugins")

-- Basic基础配置 
require("basic")

-- Auto加载
require("auto.index")

-- Keybindings加载
require('keybindings')

-- theme加载
require('theme')

-- lsp加载
require('lsp.setup')

-- cmp加载
require('cmp.setup')
