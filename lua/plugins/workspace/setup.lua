local uv = vim.loop
local pl_pretty = require("pl.pretty")

local M = {}

local data_dir = vim.fn.stdpath("data")
local workspace_dir = data_dir .. "/workspace"

function M.create_workspace_dir(workspace_name)
	-- 生成完整路径
	local full_path = data_dir .. "/workspace/" .. workspace_name

	-- 创建目录的函数
	local function mkdir_p(dir)
		if not uv.fs_stat(dir) then
			-- 递归创建父目录
			mkdir_p(vim.fn.fnamemodify(dir, ":h"))
			-- 创建当前目录
			uv.fs_mkdir(dir, 493) -- 493 = 0755 in octal
		end
	end

	-- 如果路径中包含目录，则创建这些目录
	if full_path then
		mkdir_p(full_path)
	end

	print("Workspace Folder created: " .. full_path)

	return full_path
end

function M.add_dir_into_workspace(workspace_name, dir_path, alias_name)
	-- 如果未指定 alias_name，则使用 dir_path 的最后一级目录名
	if not alias_name or alias_name == "" then
		alias_name = vim.fn.fnamemodify(dir_path, ":t")
	end

	-- 创建 workspace 文件夹
	local workspace_folder = M.create_workspace_dir(workspace_name)

	-- 生成软链接的目标路径
	local target_path = workspace_folder .. "/" .. alias_name

	-- 标准化路径以确保跨平台兼容性
	target_path = vim.fn.expand(target_path)
	dir_path = vim.fn.expand(dir_path)

	-- 创建软链接
	local success, err = uv.fs_symlink(dir_path, target_path)
	if not success then
		print("Failed to create symlink: " .. err)
	else
		print("Symlink created: " .. target_path .. " -> " .. dir_path)
	end
end

-- 获取 workspace 文件夹下所有文件夹的函数
function M.get_workspace_folders()
	local folders = {}
	local dir_iter = uv.fs_scandir(workspace_dir)
	if not dir_iter then
		print("Failed to open workspace directory")
		return folders
	end

	for entry in uv.fs_scandir_next, dir_iter do
		local path = workspace_dir .. "/" .. entry
		if uv.fs_stat(path).type == "directory" then
			table.insert(folders, entry)
		end
	end

	return folders
end

-- 获取指定 workspace 文件夹下的软链接信息
function M.get_symlinks_in_workspace(workspace_name)
	local workspace_path = workspace_dir .. "/" .. workspace_name
	local symlinks = {}

	local dir_iter = uv.fs_scandir(workspace_path)
	if not dir_iter then
		print("Failed to open workspace folder: " .. workspace_name)
		return symlinks
	end

	for entry in uv.fs_scandir_next, dir_iter do
		local path = workspace_path .. "/" .. entry
		if uv.fs_lstat(path).type == "link" then
			local target = uv.fs_readlink(path)
			table.insert(symlinks, { name = entry, target = target })
		end
	end

	return symlinks
end

-- 示例调用：获取所有 workspace 文件夹
function M.get_workspace_infos()
	local workspace_folders = M.get_workspace_folders()
	local workspace_info = {}
	for _, workspace_name in ipairs(workspace_folders) do
		print("Workspace: " .. workspace_name)
		local symlinks = M.get_symlinks_in_workspace(workspace_name)
		table.insert(workspace_info, { workspace_name = workspace_name, symlinks = symlinks })
		for _, symlink in ipairs(symlinks) do
			print("  - Alias: " .. symlink.name .. ", Target: " .. symlink.target)
		end
	end
	pl_pretty(workspace_info)
end

function M.get_workspace_info(workspace_name)
	local workspace_info = {}
	local symlinks = M.get_symlinks_in_workspace(workspace_name)
	table.insert(workspace_info, { workspace_name = workspace_name, symlinks = symlinks })
	pl_pretty(workspace_info)
end

function M.remove_workspace_symlink_by_alias(workspace_name, alias_name)
	-- 构建 workspace 目录路径
	local workspace_path = workspace_dir .. "/" .. workspace_name

	-- 查找指定别名对应的软链接并删除
	local dir_iter = uv.fs_scandir(workspace_path)
	if not dir_iter then
		print("Failed to open workspace directory: " .. workspace_path)
		return
	end

	-- 遍历 workspace 目录下的所有文件和软链接
	for entry in uv.fs_scandir_next, dir_iter do
		local entry_path = workspace_path .. "/" .. entry
		local entry_stat = uv.fs_lstat(entry_path)
		if entry_stat and entry_stat.type == "link" then
			-- 检查是否与指定的别名相匹配
			if entry == alias_name then
				uv.fs_unlink(entry_path)
				print("Symlink removed: " .. entry_path)
				break
			end
		end
	end
end

function M.remove_workspace(workspace_name)
	local workspace_path = workspace_dir .. "/" .. workspace_name
	local success, err = uv.fs_rmdir(workspace_path)
	if not success then
		print("Failed to remove workspace directory: " .. workspace_path)
		print("Error message: " .. err)
	else
		print("Workspace directory removed: " .. workspace_path)
	end
end

function M.setup()
	vim.api.nvim_command([[command! -nargs=1 WorkspaceCreate lua require("plugins.workspace.setup").create_workspace_dir(<f-args>) ]])
	vim.api.nvim_command([[command! -nargs=+ WorkspaceAdd lua require("plugins.workspace.setup").add_dir_into_workspace(<f-args>) ]])
	vim.api.nvim_command([[command! -nargs=+ WorkspaceRemove lua require("plugins.workspace.setup").remove_workspace_symlink_by_alias(<f-args>) ]])
	vim.api.nvim_command([[command! -nargs=0 WorkspaceList lua require("plugins.workspace.setup").get_workspace_infos(<f-args>) ]])
	vim.api.nvim_command([[command! -nargs=1 WorkspaceDelete lua require("plugins.workspace.setup").remove_workspace(<f-args>) ]])
	vim.api.nvim_command([[command! -nargs=1 WorkspaceInfo lua require("plugins.workspace.setup").get_workspace_info(<f-args>) ]])
end

return M
