local _M = {}

function _M.get_buf_type(buf_id)
	local buftype = vim.api.nvim_buf_get_option(buf_id, "buftype")
	return buftype
end

-- 获取窗口类型
function _M.get_win_type(win_id)
	local wintype = vim.fn.getwinvar(win_id, "&buftype")
	return wintype
end

-- 获取文件类型
function _M.get_file_type(buf_id)
	local filetype = vim.bo[buf_id].filetype
	return filetype
end

function _G.log(v)
	print(vim.inspect(v))
	return v
end

function _G.printTable(t, indent)
	indent = indent or 1

	for key, value in pairs(t) do
		local formatting = string.rep("  ", indent)

		if type(value) == "table" then
			print(formatting .. key .. " = {")
			printTable(value, indent + 1)
			print(formatting .. "}")
		else
			print(formatting .. key .. " = " .. tostring(value))
		end
	end
end

function _G.concatArray(...)
	local args = { ... }
	local outputArray = {}
	local outputArrayLength = 0
	for rIndex, array in ipairs(args) do
		local rowArrayLength = #array
		for cIndex, value in ipairs(array) do
			outputArray[outputArrayLength + cIndex] = value
		end
		outputArrayLength = outputArrayLength + rowArrayLength
	end
	return outputArray
end

function _G.mergeTable(...)
	local tabs = { ... }
	if not tabs then
		return {}
	end
	local origin = tabs[1]
	for i = 2, #tabs do
		if origin then
			if tabs[i] then
				for k, v in pairs(tabs[i]) do
					table.insert(origin, v)
				end
			end
		else
			origin = tabs[i]
		end
	end
	return origin
end

function _G.printAllWin()
	-- 获取所有窗口的ID
	local win_ids = vim.api.nvim_list_wins()

	-- 遍历并输出每个窗口的信息
	for _, win_id in ipairs(win_ids) do
		local buf_id = vim.api.nvim_win_get_buf(win_id)
		local buf_name = vim.api.nvim_buf_get_name(buf_id)
		local win_pos = vim.api.nvim_win_get_position(win_id)
		local buf_type = _M.get_buf_type(buf_id)
		local win_type = _M.get_win_type(win_id)
		local file_type = _M.get_file_type(buf_id)

		print(
			string.format(
				"窗口ID: %d, 缓冲区ID: %d, 缓冲区名称: %s, 位置: (%d, %d), 缓冲区类型: %s, 窗口类型: %s, 文件类型: %s",
				win_id,
				buf_id,
				buf_name,
				win_pos[1],
				win_pos[2],
				buf_type,
				win_type,
				file_type
			)
		)
	end
end

function _G.printCurrentWin()
	local win_id = vim.api.nvim_get_current_win()

	local buf_id = vim.api.nvim_win_get_buf(win_id)
	local buf_name = vim.api.nvim_buf_get_name(buf_id)
	local win_pos = vim.api.nvim_win_get_position(win_id)
	local buf_type = _M.get_buf_type(buf_id)
	local win_type = _M.get_win_type(win_id)
	local file_type = _M.get_file_type(buf_id)

	print(
		string.format(
			"窗口ID: %d, 缓冲区ID: %d, 缓冲区名称: %s, 位置: (%d, %d), 缓冲区类型: %s, 窗口类型: %s, 文件类型: %s",
			win_id,
			buf_id,
			buf_name,
			win_pos[1],
			win_pos[2],
			buf_type,
			win_type,
			file_type
		)
	)
end
