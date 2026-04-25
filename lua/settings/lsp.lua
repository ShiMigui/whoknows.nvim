local create_autocmd = vim.api.nvim_create_autocmd
local buf = vim.lsp.buf

return {
	lua = "lua-language-server",

	config = {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = function(client, bufnr)
			local cap = client.server_capabilities
			if not cap then
				return
			end

			if cap.documentHighlightProvider then
				create_autocmd("CursorHold", { buffer = bufnr, callback = buf.document_highlight })
				create_autocmd("CursorMoved", { buffer = bufnr, callback = buf.clear_references })
			end
		end,
	},
}
