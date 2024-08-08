local M = {}

function M.change_nvim_tree_root_to_pwd()
	local cur_path = vim.fn.getcwd()
	require("nvim-tree.api").tree.change_root(cur_path)
end

function M.change_pwd_to_nvim_tree_root()
	local nvim_tree_root = require("nvim-tree.api").tree.get_nodes().absolute_path
	vim.api.nvim_command("cd " .. nvim_tree_root)
end

vim.api.nvim_create_user_command("NvimTreeUpdateRoot2Pwd", M.change_nvim_tree_root_to_pwd, {})
vim.api.nvim_create_user_command("NvimTreeUpdatePwd2Root", M.change_pwd_to_nvim_tree_root, {})

return M
