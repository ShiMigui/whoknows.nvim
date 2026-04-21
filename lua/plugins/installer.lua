return {
	"ShiMigui/mason-catalog.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "mfussenegger/nvim-jdtls", ft = "java" },
		{ "williamboman/mason.nvim", config = true },
	},
	opts = {
		integrations = { "ensure_conform_formatters" },
		ensure_installed = { "java-debug-adapter", "java-test", "pgformatter" },
		lsp = {
			default_config = require("settings").lsp,
			extensions = {
				{ "js", "ts", "jsx", "tsx", lsp = { "typescript-language-server", "eslint-lsp" } },
				{ "json", "jsonc", lsp = { "json-lsp" } },
				{ "md", lsp = { "marksman" } },
			},
			filetypes = {
				{ "sql", lsp = "postgres-language-server" },
				{ "lua", lsp = { "lua-language-server" } },
				{ "dockerfile", lsp = "dockerfile-language-server" },
				{ "php", lsp = { "intelephense", "phpactor" } },
				{
					"yaml",
					lsps = {
						["yaml-language-server"] = {
							settings = {
								yaml = {
									schemas = {
										["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
											"docker-compose.yml",
											"docker-compose.yaml",
											"compose.yml",
											"compose.yaml",
										},
									},
									validate = true,
									completion = true,
									hover = true,
								},
							},
						},
					},
				},
			},
		},
	},
}
