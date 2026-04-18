local M = require("keymaps.utils").create_group()
local diagnostic = vim.diagnostic

---@param count integer
---@return function
local function diagnostic_helper(count)
	return function()
		diagnostic.jump({ count = count, float = true })
	end
end
M.toggle = { lhs = "gl", rhs = diagnostic.open_float, desc = "Line diagnostics" }
M.prev = { lhs = "[d", rhs = diagnostic_helper(-1), desc = "Previous diagnostic" }
M.next = { lhs = "]d", rhs = diagnostic_helper(1), desc = "Next diagnostic" }
M.loclist = { lhs = "<leader>dl", rhs = diagnostic.setloclist, desc = "Diagnostics to loclist" }
M.quickfix = { lhs = "<leader>dq", rhs = diagnostic.setqflist, desc = "Diagnostics to quickfix" }

return M
