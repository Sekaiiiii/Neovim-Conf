local status_ok, edgy = pcall(require, "edgy")
if not status_ok then
  vim.notify("Plugin Error: can't find edgy plugin")
  return
end

local actual_opts = {
  options = { left = { size = 50 }, right = { size = 0.3 } },
  wo = {
    -- Setting to `true`, will add an edgy winbar.
    -- Setting to `false`, won't set any winbar.
    -- Setting to a string, will set the winbar to that string.
    winbar = false,
    winfixwidth = false,
    winfixheight = false,
    winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
    spell = false,
    signcolumn = "no"
  },
  animate = { enabled = false },
  exit_when_last = true,
  close_when_all_hidden = true,
  left = { { ft = "NvimTree", title = "NvimTree" } },
  bottom = {
    {
      ft = "toggleterm",
      size = { height = 0.4 },
      filter = function(buf, win)
        return vim.bo[buf].buftype == "toggleterm"
      end
    }
  },
  right = {
    {
      ft = "help",
      size = { width = 0.45 },
      -- only show help buffers
      filter = function(buf)
        return vim.bo[buf].buftype == "help"
      end
    }, {
    ft = "Outline",
    open = "SymbolsOutlineOpen",
    filter = function(buf)
      return vim.bo[buf].buftype == "help"
    end
  }
  }
}

edgy.setup(actual_opts)
