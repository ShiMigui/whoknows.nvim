local ignored = {}
for _, n in ipairs(require("settings").core.ignore_names) do
	ignored[n] = true
end

return {
	"echasnovski/mini.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("mini.files").setup({
			windows = { preview = true, width_preview = 40 },
			content = {
				filter = function(e)
					return not ignored[e.name]
				end,
			},
		})
		require("keymaps").ui.file_explorer.rhs = require("mini.files").open

		require("mini.statusline").setup()
		require("mini.surround").setup()
		require("mini.comment").setup()
		require("mini.basics").setup()
		require("mini.move").setup()
		require("mini.pairs").setup()
	end,
}
