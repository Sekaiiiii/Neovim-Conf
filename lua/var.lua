-- 常见变量定义

-- Gui启动标识
if vim.fn.exists(':GuiFont') then
  vim.g.guiFlag = true
end

-- 字体名称
vim.g.font = 'FiraCode Nerd Font Mono'
-- 字体大小
vim.g.fontSize = 12

if vim.fn.exists(":GuiFont") then
  local cmd = "command! GuiFont " .. vim.g.font .. ":h" .. vim.g.fontSize
  vim.api.nvim_command(cmd)
end
