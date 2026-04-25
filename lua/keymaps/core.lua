---@return table<string, Mapping>
return {
	next_buffer = { lhs = "]b", desc = "Next buffer" },
	prev_buffer = { lhs = "[b", desc = "Previous buffer" },
	exit_insert = { lhs = "jk", rhs = "<Esc>", desc = "Exit insert mode", mode = "i" },
	close_buffer = { lhs = "<leader>bd", rhs = "<cmd>bd<cr>", desc = "Close buffer" },

	file_explorer = { lhs = "<leader>e", cmd = "Explore", desc = "Open file explorer" },
}
