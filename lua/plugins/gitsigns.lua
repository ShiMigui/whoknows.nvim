local custom = require("core.mapping").custom

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
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
		custom.next_hunk = { lhs = "]h", rhs = builder("next"), desc = "Next hunk" }
		custom.prev_hunk = { lhs = "[h", rhs = builder("prev"), desc = "Previous hunk" }
		custom.stage_hunk = { lhs = "<leader>hs", rhs = gs.stage_hunk, desc = "Stage hunk" }

		custom.reset_hunk = { lhs = "<leader>hr", rhs = gs.reset_hunk, desc = "Reset hunk" }
		custom.preview_hunk = { lhs = "<leader>hp", rhs = gs.preview_hunk, desc = "Preview hunk" }
		custom.blame_line = { lhs = "<leader>hb", rhs = gs.blame_line, desc = "Blame line" }
		custom.toggle_blame = { lhs = "<leader>tb", rhs = gs.toggle_current_line_blame, desc = "Toggle blame" }
		custom.diffthis = { lhs = "<leader>hd", rhs = gs.diffthis, desc = "Diff this" }
	end,
}
