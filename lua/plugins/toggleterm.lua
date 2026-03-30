local terminal = require("core.mapping").terminal

print("SETTING TERMINAL RHS")
return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = { direction = "horizontal", size = 15 },
	config = function(_, opts)
		require("toggleterm").setup(opts)
		local Terminal = require("toggleterm.terminal").Terminal
		local main_term = Terminal:new()

		function terminal.toggle.rhs()
			main_term:toggle()
		end
		function terminal.exit.rhs()
			main_term:close()
		end
	end,
}
