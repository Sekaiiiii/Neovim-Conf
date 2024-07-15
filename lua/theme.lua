local termColorScheme = "nightfox"
local guiColorScheme = "nightfox"

local colorscheme = termColorScheme

if vim.fn.has("gui_running") == 1 then
  colorscheme = guiColorScheme
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("ColorScheme Error: " .. colorscheme .. " can't find")
  return
end
