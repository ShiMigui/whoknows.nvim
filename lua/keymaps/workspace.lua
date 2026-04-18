local M = require("keymaps.utils").create_group()
local buf = vim.lsp.buf

M.add = { lhs = "<leader>wa", rhs = buf.add_workspace_folder, desc = "Add workspace folder" }
M.remove = { lhs = "<leader>wr", rhs = buf.remove_workspace_folder, desc = "Remove workspace dir" }
M.symbol = { lhs = "<leader>ws", rhs = buf.workspace_symbol, desc = "Search workspace symbols" }
M.document_symbol = { lhs = "<leader>ds", rhs = buf.document_symbol, desc = "Search document symbols" }

return M
