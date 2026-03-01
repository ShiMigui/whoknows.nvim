local lsps = {
  "lua_ls",
  "ts_ls",
  "eslint",
  "emmet_language_server",
}

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local LSP = vim.lsp
		for _, lsp in ipairs(lsps) do
			LSP.config(lsp, { capabilities = capabilities })
			LSP.enable(lsp)
		end
	end,
}
