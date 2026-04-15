return {
	"ShiMigui/mason-catalog.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		{ "mfussenegger/nvim-jdtls", ft = "java" },
		{ "williamboman/mason.nvim", config = true },
	},
	opts = {
		silent = true,
		integrations = { "ensure_conform_formatters" },
		ensure_installed = { "java-debug-adapter", "java-test", "pgformatter" },
		lsp = {
			default_config = require("settings.lsp_config"),
			by_group = {
				{ extensions = { "js", "ts", "jsx", "tsx" }, lsps = { "typescript-language-server", "eslint-lsp" } },
				{ extensions = { "json", "jsonc" }, lsps = { "json-lsp" } },
				{ extensions = { "md" }, lsps = { "marksman" } },
			},
			by_ft = {
				sql = "postgres-language-server",
				lua = "lua-language-server",
				dockerfile = "dockerfile-language-server",
				php = { "intelephense", "phpactor" },
				java = { jdtls = { cmd = { "jdtls", "-data", vim.fn.stdpath("cache") .. "/jdtls-workspace" } } },
				yaml = {
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
}
