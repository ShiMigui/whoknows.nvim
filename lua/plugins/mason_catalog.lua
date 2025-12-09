local keymap = require("configs.keymap")
return {
	{
		"stevearc/conform.nvim",
		opts = { formatters_by_ft = { lua = { "stylua" } }, format_on_save = false },
		config = function(_, opts)
			local conform = require("conform")
			keymap("n", "<leader>gf", conform.format, "Formats current file")
			conform.setup(opts)
		end,
	},
	{
		"ShiMigui/mason-catalog.nvim",
    dependencies = "neovim/nvim-lspconfig",
		config = function(_, opts)
			require("mason-catalog.integrations.ensure_conform_pkgs").setup()
			require("mason-catalog.integrations.config_lsp_servers").setup(require("configs.lsp"))
			require("mason-catalog").setup(opts)
		end,
	},
}
