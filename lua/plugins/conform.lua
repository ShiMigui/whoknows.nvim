return {
	"stevearc/conform.nvim",
	dependencies = {
		"zapling/mason-conform.nvim",
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			php = { "intelephense" },
		},
		format_on_save = false,
	},
	config = function(_, opts)
		local conform, mason_conform = require("conform"), require("mason-conform")
		conform.setup(opts)
		mason_conform.setup()

		vim.keymap.set("n", "<leader>gf", conform.format, { desc = "Formatar arquivo atual" })
	end,
}
