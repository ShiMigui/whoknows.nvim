local mapping = require("core.actions")
local ts = "typescript-language-server"

return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				js = { "prettier" },
				jsx = { "prettier" },
				tsx = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
			},
		},
	},
	{
		"ShiMigui/mason-catalog.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", cmd = "Mason", config = true },
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
			},
			{ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" } },
		},
		opts = {
			lsp = {
				default_config = { capabilities = require("cmp_nvim_lsp").default_capabilities() },
				by_ft = {
					lua = "lua-language-server",
					jsx = ts,
					tsx = ts,
					js = ts,
					ts = ts,
				},
			},
			ensure_installed = { "prettier", "stylua" },
			create_autocmd = true,
		},
		config = function(_, opts)
			local catalog = require("mason-catalog")
			catalog.setup(opts)

			mapping.format = require("conform").format
		end,
	},
}
