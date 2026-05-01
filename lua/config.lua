return {
	formatters = {
		lua = { "stylua" },
	},

	lsps = {
		lua = "lua-language-server",
		{ "js", "ts", "tsx", "jsx", lsp = "typescript-language-server" },
	},

	ignore_files = { ".git/", "vendor/", "node_modules/" },
}
