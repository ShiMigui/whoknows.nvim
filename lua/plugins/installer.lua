return {
	"ShiMigui/catalog.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim", opts = {} },
	},
	opts = {
		conform = true,
		lsp = {
			config = require("settings").lsp,

			lua = "lua-language-server",
		},
	},
	config = function(_, opts)
		local registry = require("mason-registry")

		if #registry.get_all_packages() > 0 then
			require("catalog").setup(opts)
		else
			registry.refresh(function()
				require("catalog").setup(opts)
			end)
		end
	end,
}
