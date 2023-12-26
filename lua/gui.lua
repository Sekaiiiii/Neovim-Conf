vim.defer_fn(function()
  if vim.fn.exists(":GuiFont") == 2 then
    local cmd = "GuiFont " .. vim.g.font .. ":h" .. vim.g.fontSize
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiTabline") == 2 then
    local cmd = "GuiTabline 0"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiPopupmenu") == 2 then
    local cmd = "GuiPopupmenu 0"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiScrollBar") == 2 then
    local cmd = "GuiScrollBar 0"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiTreeviewHide") == 2 then
    local cmd = "GuiTreeviewHide"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiAdaptiveColor") == 2 then
    local cmd = "GuiAdaptiveColor 2"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiLinespace") == 2 then
    local cmd = "GuiLinespace 1"
    vim.api.nvim_command(cmd)
  end

  if vim.fn.exists(":GuiWindowOpacity") == 2 then
    local cmd = "GuiWindowOpacity 0.95"
    vim.api.nvim_command(cmd)
  end
end, 1000)
