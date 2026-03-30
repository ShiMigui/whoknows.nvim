return {
	"ShiMigui/mason-catalog.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "williamboman/mason.nvim", config = true },
		{ "stevearc/conform.nvim", config = require("plugins.configs.conform") },
	},
	opts = require("plugins.configs.mason-catalog"),
}
