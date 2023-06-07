local M = {
    config_path = vim.fn.stdpath("config"),
    keys = {leader_key = "\\"},
    nvimTree = {
        enable = true,
        toggle = "<A-m>",
        edit = {"o", "<2-LeftMouse>"},
        system_open = "<CR>",
        -- v分屏打开文件
        vsplit = "sv",
        -- h分屏打开文件
        split = "sh",
        -- toggle .gitignore (git enable)
        toggle_git_ignored = "i",
        -- Hide (dotfiles)
        toggle_dotfiles = ".",
        -- togglle custom config
        toggle_custom = "u",

        refresh = "R",
        -- 文件操作
        create = "a",
        remove = "d",
        rename = "r",
        cut = "x",
        copy = "c",
        paste = "p",
        copy_name = "y",
        copy_path = "Y",
        copy_absolute_path = "gy",
        toggle_file_info = "I",
        tabnew = "t",
        -- 进入下一级
        cd = "]",
        -- 进入上一级
        dir_up = "["
    }

}

return M
