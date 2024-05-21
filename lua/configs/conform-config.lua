local options = {

	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		vue = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		less = { "prettier" },
		sass = { "prettier" },
	},
}

require("conform").setup(options)
