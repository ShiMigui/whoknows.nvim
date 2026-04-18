local create_autocmd = vim.api.nvim_create_autocmd
local buf = vim.lsp.buf

local ok, cmp = pcall(require, "cmp_nvim_lsp")

---@type vim.lsp.Config
return {
	capabilities = (ok and cmp) and cmp.default_capabilities() or vim.lsp.protocol.make_client_capabilities(),
	on_attach = function(client, bufnr)
		local cap = client.server_capabilities
		if cap then
			if cap.documentHighlightProvider then
				create_autocmd("CursorHold", { buffer = bufnr, callback = buf.document_highlight })
				create_autocmd("CursorMoved", { buffer = bufnr, callback = buf.clear_references })
			end
		end
	end,
}
