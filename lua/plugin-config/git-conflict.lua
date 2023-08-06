local status, git_conflict = pcall(require, "git-conflict")
if not status then
  vim.notify("Plugin Error: can't find git_conflict plugin")
  return
end

git_conflict.setup()
