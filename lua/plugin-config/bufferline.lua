local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    vim.notify("Plugin Error: can't find bufferline plugin")
    return
end

-- You need to be using termguicolors for this plugin to work, as it reads the hex gui color values of various highlight groups.
vim.opt.termguicolors = true

bufferline.setup({
    options = {
        numbers = "buffer_id",
        offsets = {
            {
                filetype = "NvimTree",
                text = " File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
})

