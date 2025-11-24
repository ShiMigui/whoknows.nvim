return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = "neovim/nvim-lspconfig",
	config = function()
		local mason_lsp = require("mason-lspconfig")
		local cfg = require('configs.lsp')
		mason_lsp.setup()

		local servers = mason_lsp.get_installed_servers()

		for _, name in ipairs(servers) do
			vim.lsp.config(name, cfg)
			vim.lsp.enable(name)
		end
	end,
}
