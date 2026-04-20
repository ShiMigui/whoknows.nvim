local diagnostic = vim.diagnostic

---@param count integer
---@return function
local function diagnostic_helper(count)
	return function()
		diagnostic.jump({ count = count, float = true })
	end
end

---@return table<string, Mapping>
return {
	next = { lhs = "]d", rhs = diagnostic_helper(1), desc = "Next diagnostic" },
	prev = { lhs = "[d", rhs = diagnostic_helper(-1), desc = "Previous diagnostic" },

	toggle = { lhs = "gl", rhs = diagnostic.open_float, desc = "Line diagnostics" },
	loclist = { lhs = "<leader>dl", rhs = diagnostic.setloclist, desc = "Diagnostics to loclist" },
	quickfix = { lhs = "<leader>dq", rhs = diagnostic.setqflist, desc = "Diagnostics to quickfix" },
}
