local opts = {
	on_attach = function(client, bufnr)
		-- 禁用格式化功能，交给专门插件插件处理
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		-- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		require("mappings").lsp.onAttach(buf_set_keymap)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
}

return {
	on_setup = function(server)
		server.setup(opts)
	end,
}
