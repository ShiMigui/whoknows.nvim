local u = require("core.keymaps.utils")
local M = u.create_group()
local lsp = vim.lsp
local buf = lsp.buf

local function fmt()
	buf.format({ async = true })
end
local function toggle_inlay_hints()
	lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled())
end

M.definition = { lhs = "gd", rhs = buf.definition, desc = "Go to definition" }
M.declaration = { lhs = "gD", rhs = buf.declaration, desc = "Go to declaration" }
M.implementation = { lhs = "gi", rhs = buf.implementation, desc = "Go to implementation" }
M.type_definition = { lhs = "gt", rhs = buf.type_definition, desc = "Go to type definition" }
M.references = { lhs = "gr", rhs = buf.references, desc = "List references" }
M.hover = { lhs = "K", rhs = buf.hover, desc = "Hover documentation" }
M.signature = { mode = { "n", "i" }, lhs = "<C-k>", rhs = buf.signature_help, desc = "Signature help" }
M.rename = { lhs = "<leader>rn", rhs = buf.rename, desc = "Rename symbol" }
M.code_action = { mode = { "n", "v" }, lhs = "<leader>ca", rhs = buf.code_action, desc = "Code action" }
M.format = { mode = { "n", "v" }, lhs = "<leader>f", rhs = fmt, desc = "Format buffer" }
M.inlay_hints = { lhs = "<leader>th", rhs = toggle_inlay_hints, desc = "Toggle inlay hints" }

return M
