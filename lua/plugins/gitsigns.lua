local core = require("core.keymaps.core")

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

		core.next_hunk.rhs = builder("next")
		core.prev_hunk.rhs = builder("prev")
		core.diffthis.rhs = gs.diffthis
		core.stage_hunk.rhs = gs.stage_hunk
		core.reset_hunk.rhs = gs.reset_hunk
		core.blame_line.rhs = gs.blame_line
		core.preview_hunk.rhs = gs.preview_hunk
		core.toggle_blame.rhs = gs.toggle_current_line_blame
	end,
}
