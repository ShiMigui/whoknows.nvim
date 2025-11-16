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

		local files = require("mini.files")
		files.setup()
		local state, close = files.get_explorer_state, files.close
		files.toggle = function() (state() and close or files.open)() end
		files.quit = function() if state() then close() end end
		vim.keymap.set({ "n", "i", "v" }, "<leader>b", files.toggle)
		vim.keymap.set({ "n", "i", "v" }, "<ESC><ESC>", files.quit)
	end,
}
