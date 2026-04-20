return {
	"nvim-mini/mini.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.basics").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
	end,
}
