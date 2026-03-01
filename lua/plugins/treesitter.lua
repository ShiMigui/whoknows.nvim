return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = { "lua" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
