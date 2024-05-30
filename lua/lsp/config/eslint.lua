local opts = {
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		-- client.server_capabilities.document_formatting = false
		-- client.server_capabilities.document_range_formatting = false
		vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = "EslintFixAll" })
	end,
}

return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
