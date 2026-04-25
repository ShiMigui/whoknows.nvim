return {
	"ShiMigui/catalog.nvim",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
	},
	opts = {
		lsp = require("settings").lsp,
		conform = true,
	},
	config = function(_, opts)
		local registry = require("mason-registry") -- It's needed since Mason registry should not be cached yet

		if #registry.get_all_packages() > 0 then
			require("catalog").setup(opts)
		else
			registry.refresh(function()
				require("catalog").setup(opts)
			end)
		end
	end,
}
