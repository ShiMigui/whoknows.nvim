local core = require("keymaps").core

return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
		},
	},
	config = function(_, opts)
		local gs = require("gitsigns")

		gs.setup(opts)

		local function builder(str)
			return function()
				gs.nav_hunk(str)
			end
		end

		core.next_hunk = { lhs = "]h", desc = "Next hunk", rhs = builder("next") }
		core.prev_hunk = { lhs = "[h", desc = "Previous hunk", rhs = builder("prev") }
		core.diffthis = { lhs = "<leader>hd", desc = "Diff this", rhs = gs.diffthis }
		core.stage_hunk = { lhs = "<leader>hs", desc = "Stage hunk", rhs = gs.stage_hunk }
		core.reset_hunk = { lhs = "<leader>hr", desc = "Reset hunk", rhs = gs.reset_hunk }
		core.blame_line = { lhs = "<leader>hb", desc = "Blame line", rhs = gs.blame_line }
		core.preview_hunk = { lhs = "<leader>hp", desc = "Preview hunk", rhs = gs.preview_hunk }
		core.toggle_blame = { lhs = "<leader>tb", desc = "Toggle blame", rhs = gs.toggle_current_line_blame }
	end,
}
