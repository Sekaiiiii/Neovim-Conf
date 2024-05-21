local status, cmp = pcall(require, "cmp")
if not status then
  return
end

local status, config = pcall(require, "keybindings")
if not status then
  return
end

local mapping = {
  -- 出现补全
  [config.cmp_keys.cmp_complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  -- 取消
  [config.cmp_keys.cmp_abort] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  -- 确认
  [config.cmp_keys.cmp_confirm] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  }),
  -- 如果窗口内容太多，可以滚动
  [config.cmp_keys.cmp_scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
  [config.cmp_keys.cmp_scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  -- 上一个
  [config.cmp_keys.cmp_select_prev_item] = cmp.mapping.select_prev_item(),
  -- 下一个
  [config.cmp_keys.cmp_select_next_item] = cmp.mapping.select_next_item(),
}

cmp.setup({
  -- 指定 snippet 引擎 luasnip
  window = { completion = cmp.config.window.bordered() },
  -- 快捷键
  mapping = mapping,
  -- 来源
  sources = cmp.config.sources({
    { name = "nvim_lsp", group_index = 1 },
    { name = "buffer",   group_index = 2 },
    { name = "path",     group_index = 2 },
  }),

  -- 使用lspkind-nvim显示类型图标
  formatting = require("cmp.lspkind").formatting,
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer" } },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

cmp.setup.filetype({ "markdown", "help" }, {
  sources = { { name = "buffer" }, { name = "path" } },
})

-- require("cmp.luasnip")
