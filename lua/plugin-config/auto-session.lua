local status_ok, autoSession = pcall(require, "auto-session")
if not status_ok then
    vim.notify("Plugin Error: can't find auto-session plugin")
    return
end

autoSession.setup({
    log_level = "error",
    -- 打开这些目录里面的内容时，不加载会话
    auto_session_suppress_dirs = {},
    auto_session_enable_last_session = false,
    -- 保存session文件到data目录
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = nil,
    auto_restore_enabled = true,
    auto_session_use_git_branch = nil,
    -- the configs below are lua only
    bypass_session_save_file_types = nil
})
