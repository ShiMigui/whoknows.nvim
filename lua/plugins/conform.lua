local keymaps = require("keymaps.lsp")
local user_config = require("settings").core

return {
	"stevearc/conform.nvim",
	opts = {
		default_format_opts = { lsp_format = "fallback" },
		formatters_by_ft = require("settings").formatters,
		format_on_save = function()
			return user_config.auto_format and { timeout_ms = 500 } or nil
		end,
	},
	config = function(_, opts)
		local cfm = require("conform")
		cfm.setup(opts)
		function keymaps.format.rhs()
			cfm.format({ async = true })
		end
	end,
}
