return {
	"nvim-mini/mini.nvim",
	lazy = false,
	config = function()
		require("mini.basics").setup()
		require("mini.move").setup()
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.bracketed").setup()
	end,
}
