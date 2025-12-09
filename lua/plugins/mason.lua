local keymap = require("core.keymap")
local packages = {
	ensure_installed = { "lua-language-server" },
	formatters_by_ft = { lua = { "stylua" } },
}

local lsp_config = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	on_attach = function(client, bufnr) end,
}

return {
	{
		"stevearc/conform.nvim",
		opts = { formatters_by_ft = packages.formatters_by_ft, format_on_save = true },
		config = function(_, opts)
			local conform = require("conform")
			keymap("n", "<leader>gf", conform.format, "Formats current file")
			conform.setup(opts)
		end,
	},
	{
		"ShiMigui/mason-catalog.nvim",
		dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
		---@type MsnCatalogDefaultOpts
		opts = { ensure_installed = packages.ensure_installed },
		config = function(_, opts)
			require("mason-catalog.integrations.ensure_conform_pkgs").setup()
			require("mason-catalog.integrations.config_lsp_servers").setup(lsp_config)
			require("mason-catalog").setup(opts)
		end,
	},
}
