local termColorScheme = "github_dark"
local guiColorScheme = "github_dark_high_contrast"
local colorscheme = termColorScheme

if vim.fn.has("gui_running") == 1 then
  colorscheme = guiColorScheme
end

require("github-theme").setup({
  options = {
    transparent = true,
  },
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("ColorScheme Error: " .. colorscheme .. " can't find")
  return
end
