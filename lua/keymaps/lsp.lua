local lsp = vim.lsp
local buf = lsp.buf

local function fmt()
	buf.format({ async = true })
end
local function toggle_inlay_hints()
	lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
end

---@return table<string, Mapping>
return {
	hover = { lhs = "K", rhs = buf.hover, desc = "Hover documentation" },
	format = { lhs = "<leader>f", rhs = fmt, desc = "Format buffer", mode = { "n", "v" } },
	rename = { lhs = "<leader>rn", rhs = buf.rename, desc = "Rename symbol" },
	signature = { lhs = "<C-k>", rhs = buf.signature_help, desc = "Signature help", mode = { "n", "i" } },
	definition = { lhs = "gd", rhs = buf.definition, desc = "Go to definition" },
	references = { lhs = "gr", rhs = buf.references, desc = "List references" },
	code_action = { lhs = "<leader>ca", rhs = buf.code_action, desc = "Code action", mode = { "n", "v" } },
	inlay_hints = { lhs = "<leader>th", rhs = toggle_inlay_hints, desc = "Toggle inlay hints" },
	declaration = { lhs = "gD", rhs = buf.declaration, desc = "Go to declaration" },
	implementation = { lhs = "gi", rhs = buf.implementation, desc = "Go to implementation" },
	type_definition = { lhs = "gt", rhs = buf.type_definition, desc = "Go to type definition" },
}
