local k = require("keymaps").custom

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

		k.next_hunk = { lhs = "]c", desc = "Next hunk", rhs = builder("next") }
		k.prev_hunk = { lhs = "[c", desc = "Previous hunk", rhs = builder("prev") }
		k.diffthis = { lhs = "<leader>hd", desc = "Diff this", rhs = gs.diffthis }
		k.stage_hunk = { lhs = "<leader>hs", desc = "Stage hunk", rhs = gs.stage_hunk }
		k.reset_hunk = { lhs = "<leader>hr", desc = "Reset hunk", rhs = gs.reset_hunk }
		k.blame_line = { lhs = "<leader>hb", desc = "Blame line", rhs = gs.blame_line }
		k.preview_hunk = { lhs = "<leader>hp", desc = "Preview hunk", rhs = gs.preview_hunk }
		k.toggle_blame = { lhs = "<leader>tb", desc = "Toggle blame", rhs = gs.toggle_current_line_blame }
	end,
}
