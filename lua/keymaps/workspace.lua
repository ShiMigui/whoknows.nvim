local buf = vim.lsp.buf

---@return table<string, Mapping>
return {
	add = { lhs = "<leader>wa", rhs = buf.add_workspace_folder, desc = "Add workspace folder" },
	remove = { lhs = "<leader>wr", rhs = buf.remove_workspace_folder, desc = "Remove workspace dir" },
	symbol = { lhs = "<leader>ws", rhs = buf.workspace_symbol, desc = "Search workspace symbols" },
	document_symbol = { lhs = "<leader>ds", rhs = buf.document_symbol, desc = "Search document symbols" },
}
