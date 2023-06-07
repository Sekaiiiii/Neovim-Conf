local autocmd = vim.api.nvim_create_autocmd
local autoGroup1 = vim.api.nvim_create_augroup("autoGroup1", {clear = true})

autocmd("SessionLoadPost",
        {group = autoGroup1, pattern = "*", command = "NvimTreeToggle"})
