vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("UpdateRemotePlugins")
		vim.cmd("WorkspacePluginInit")
	end,
})

