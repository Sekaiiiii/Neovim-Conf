local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("Plugin Error: can't find alpha plugin")
	return
end

local dashboard = require("alpha.themes.dashboard")

local _M = {}

function _M.gen_goto_nvim_config_str()
	local nvim_path = vim.fn.stdpath("config")
	local cmd_str = "<cmd>cd " .. nvim_path .. "<CR>"
	return cmd_str
end

dashboard.section.header.val = {
	[[ .oooooo..o oooooooooooo oooo    oooo       .o.       ooooo ooooo ooooo ooooo ooooo]],
	[[d8P'    `Y8 `888'     `8 `888   .8P'       .888.      `888' `888' `888' `888' `888']],
	[[Y88bo.       888          888  d8'        .8"888.      888   888   888   888   888 ]],
	[[ `"Y8888o.   888oooo8     88888[         .8' `888.     888   888   888   888   888 ]],
	[[     `"Y88b  888    "     888`88b.      .88ooo8888.    888   888   888   888   888 ]],
	[[oo     .d8P  888       o  888  `88b.   .8'     `888.   888   888   888   888   888 ]],
	[[8""88888P'  o888ooooood8 o888o  o888o o88o     o8888o o888o o888o o888o o888o o888o]],
}

local btn_table = {
	dashboard.button("c", "GOTO_CONFIG", _M.gen_goto_nvim_config_str()),
	dashboard.button("q", "QUIT", "<CMD>quit<CR>"),
}

dashboard.section.buttons.val = btn_table

alpha.setup(dashboard.config)
