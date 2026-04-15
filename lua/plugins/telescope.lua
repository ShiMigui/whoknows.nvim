local workspaces = require("core.keymaps.workspace")
local core = require("core.keymaps.core")
local lsp = require("core.keymaps.lsp")

return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,
				case_mode = "smart_case",
				override_file_sorter = true,
				override_generic_sorter = true,
			},
		},
		defaults = { file_ignore_patterns = require("settings.config").ignore_names },
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("fzf")

		local b = require("telescope.builtin")

		function core.find_neovim.rhs()
			b.find_files({ cwd = vim.fn.stdpath("config") })
		end
		core.buffers.rhs = b.buffers
		core.help_tags.rhs = b.help_tags
		core.live_grep.rhs = b.live_grep
		core.find_files.rhs = b.find_files

		lsp.definition.rhs = b.lsp_definitions
		lsp.references.rhs = b.lsp_references
		lsp.implementation.rhs = b.lsp_implementations
		lsp.type_definition.rhs = b.lsp_type_definitions

		workspaces.symbol.rhs = b.lsp_workspace_symbols
		workspaces.document_symbol.rhs = b.lsp_document_symbols
	end,
}
