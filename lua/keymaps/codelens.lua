local lsp = vim.lsp

---@return table<string, Mapping>
return {
	run = { lhs = "<leader>cl", rhs = lsp.codelens.run, desc = "Run CodeLens" },
	refresh = { lhs = "<leader>cr", rhs = lsp.codelens.refresh, desc = "Refresh CodeLens" },
}
