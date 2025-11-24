return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	lazy = false,
	build = "make install_jsregexp",
	config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
}
