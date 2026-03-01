local map = require("core.actions").set

return {
	"echasnovski/mini.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local MiniFiles = require("mini.files")
		MiniFiles.setup({ windows = { preview = true, width_preview = 40 } })

		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.basics").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()

		map("n", "<leader>e", MiniFiles.open, "Open file explorer")
	end,
}
