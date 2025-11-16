local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local function on_attach(client, bufnr) end

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = function()
		local mason_lsp = require("mason-lspconfig")
		mason_lsp.setup()

		local servers = mason_lsp.get_installed_servers()
		local cfg = { capabilities = capabilities, on_attach = on_attach }
		for _, name in ipairs(servers) do
			vim.lsp.config(name, cfg)
			vim.lsp.enable(name)
		end
	end,
}
