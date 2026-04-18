local M = require("keymaps.utils").create_group()

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
M.cp_rpath = { lhs = "<leader>crp", rhs = copy_helper("%"), desc = "Copy relative path" }
M.cp_apath = { lhs = "<leader>cap", rhs = copy_helper("%:p"), desc = "Copy absolute path" }
M.cp_filename = { lhs = "<leader>cf", rhs = copy_helper("%:t"), desc = "Copy filename" }

M.close_buffer = { lhs = "<leader>bd", rhs = "<cmd>bd<cr>", desc = "Close buffer" }
M.next_buffer = { lhs = "]b", desc = "Next buffer" }
M.prev_buffer = { lhs = "[b", desc = "Previous buffer" }
M.exit_insert = { mode = "i", lhs = "jk", rhs = "<Esc>", desc = "Exit insert mode" }

return M
