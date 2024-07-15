local pl_pretty = require("pl.pretty")
local pl_tablex = require("pl.tablex")
local edgy = require("edgy")

local last_buf = ""
local last_win = ""
local is_restoring = false

-- 定义一个函数，当缓冲区切换时执行
local function on_buffer_enter()
	if is_restoring then
		return
	end

	local current_buf = vim.api.nvim_get_current_buf()
	local current_win = vim.api.nvim_get_current_win()
	print("之前窗口ID：" .. last_win .. "，当前缓冲区ID：" .. last_buf)
	print("当前窗口ID：" .. current_win .. "，当前缓冲区ID：" .. current_buf)

	-- 在这里添加你的条件来决定是否阻止缓冲区切换
	local need_refresh_flag = false
	local edgy_obj = edgy.get_win()
	if type(edgy_obj) ~= "table" then
		need_refresh_flag = true
	end
	pl_pretty(edgy_obj)

	if false then -- 假设你不想切换到缓冲区 ID 为 1 的缓冲区
		if last_buf and last_win then
			-- 设置一个标志，表示正在恢复
			is_restoring = true
			-- 切换回之前的缓冲区和窗口
			vim.defer_fn(function()
				vim.api.nvim_set_current_win(last_win)
				vim.api.nvim_set_current_buf(last_buf)
				-- 恢复完成后清除标志
				is_restoring = false
			end, 10) -- 延迟 10 毫秒以确保切换生效
		end
	else
		-- 更新上一个缓冲区和窗口 ID
		last_buf = current_buf
		last_win = current_win
	end
end

-- 创建自动命令，当缓冲区切换时调用上面的函数
vim.api.nvim_create_autocmd("BufEnter", {
	callback = on_buffer_enter,
})
