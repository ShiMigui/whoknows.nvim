return {
	formatters = {
		lua = { "stylua" },
	},

	lsps = {
		lua = "lua-language-server",
		{ "js", "ts", "tsx", "jsx", lsp = "typescript-language-server" },
	},
}
