local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("Plugin Error: can't find alpha plugin")
	return
end

local dashboard = require("alpha.themes.dashboard")

function getSessionInfo()
	local path = vim.fn.stdpath("data") .. "\\sessions"

	local sessionDictTable = {}
	local cnt = 0
	for file in vim.fs.dir(path) do
		local folderPath = file
		folderPath = string.sub(folderPath, 0, -4)
		folderPath = string.gsub(folderPath, "++", ":")
		folderPath = string.gsub(folderPath, "-", "//")
		sessionDictTable[cnt] = {
			name = file,
			sessionPath = path .. "\\" .. file,
			folderPath = folderPath,
		}
		cnt = cnt + 1
	end

	if cnt < 1 then
		return nil
	else
		return sessionDictTable
	end
end

function sessionClick(folderPath)
	vim.cmd("cd " .. folderPath)
	vim.cmd("SessionRestore")
end

dashboard.section.header.val = {
	[[                               __                ]],
	[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
	[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
	[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}

local defaultBtnTable = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
}

local sessionInfo = getSessionInfo()

if type(sessionInfo) ~= "table" then
	dashboard.section.buttons.val = defaultBtnTable
else
	local sessionBtnTable = {}
	for i = 0, #sessionInfo, 1 do
		local btnName = "Session: " .. sessionInfo[i].name
		local btnOp = '<CMD>lua sessionClick("' .. sessionInfo[i].folderPath .. '")<CR>'
		table.insert(sessionBtnTable, dashboard.button(";", btnName, btnOp))
	end
	dashboard.section.buttons.val = _G.mergeTable(sessionBtnTable, defaultBtnTable)
end

alpha.setup(dashboard.config)
