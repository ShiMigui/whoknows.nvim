local u = require("core.keymaps.utils")
local M = u.create_group()

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

-- GIT
M.next_hunk = { lhs = "]h", desc = "Next hunk" }
M.prev_hunk = { lhs = "[h", desc = "Previous hunk" }
M.stage_hunk = { lhs = "<leader>hs", desc = "Stage hunk" }
M.reset_hunk = { lhs = "<leader>hr", desc = "Reset hunk" }
M.preview_hunk = { lhs = "<leader>hp", desc = "Preview hunk" }
M.blame_line = { lhs = "<leader>hb", desc = "Blame line" }
M.toggle_blame = { lhs = "<leader>tb", desc = "Toggle blame" }
M.diffthis = { lhs = "<leader>hd", desc = "Diff this" }

-- TELESCOPE
M.buffers = { lhs = "<leader>fb", desc = "Buffers" }
M.help_tags = { lhs = "<leader>fh", desc = "Help tags" }
M.live_grep = { lhs = "<leader>fg", desc = "Live grep" }
M.find_files = { lhs = "<leader>ff", desc = "Find files" }
M.find_neovim = { lhs = "<leader>fn", desc = "Find Neovim config" }

return M
