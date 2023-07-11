local autocmd = vim.api.nvim_create_autocmd

local autoGroup_session = vim.api.nvim_create_augroup("autoGroup_session",
                                                      {clear = true})

local autoGroup_autoFold = vim.api.nvim_create_augroup("autoFold",
                                                       {clear = true});

-- autocmd("SessionLoadPost",
--         {group = autoGroup_session, pattern = "*", command = "NvimTreeToggle"})

-- autocmd("BufEnter",
--         {group = autoGroup_autoFold, pattern = {"*"}, command = "normal zx"})


autocmd("TextChanged", {
    group = autoGroup_autoFold,
    pattern = "*",
    command = "lua vim.opt.foldexpr='nvim_treesitter#foldexpr()'"
})

