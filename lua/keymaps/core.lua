local function copy_helper(expr)
	return function()
		local path = vim.fn.expand(expr)
		if path == "" then
			print("No file")
		else
			vim.fn.setreg("+", path)
			print("Copied: " .. path)
		end
	end
end

---@return table<string, Mapping>
return {
	cp_rpath = { lhs = "<leader>crp", rhs = copy_helper("%"), desc = "Copy relative path" },
	cp_apath = { lhs = "<leader>cap", rhs = copy_helper("%:p"), desc = "Copy absolute path" },
	cp_flnme = { lhs = "<leader>cf", rhs = copy_helper("%:t"), desc = "Copy filename" },

	next_buffer = { lhs = "]b", desc = "Next buffer" },
	prev_buffer = { lhs = "[b", desc = "Previous buffer" },
	exit_insert = { lhs = "jk", rhs = "<Esc>", desc = "Exit insert mode", mode = "i" },
	close_buffer = { lhs = "<leader>bd", rhs = "<cmd>bd<cr>", desc = "Close buffer" },
}
