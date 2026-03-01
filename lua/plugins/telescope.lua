local mappings = require('core.actions')
local map = mappings.set

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
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
		pickers = {
			buffers = {
				mappings = {
					i = { ["<C-d>"] = "delete_buffer" },
					n = { ["d"] = "delete_buffer" },
				},
			},
		},
	},
	config = function(_, opts)
		local tlp = require("telescope")
		tlp.setup(opts)
		tlp.load_extension("fzf")

		local bltn = require("telescope.builtin")

		map("n", "<leader>ff", bltn.find_files, "Find files")
		map("n", "<leader>fg", bltn.live_grep, "Live grep")
		map("n", "<leader>fb", bltn.buffers, "Buffers")
		map("n", "<leader>fh", bltn.help_tags, "Help tags")

		mappings.go_to_definition = bltn.lsp_definitions
		mappings.list_references = bltn.lsp_references
		mappings.go_to_implementation = bltn.lsp_implementations
		mappings.go_to_type_definition = bltn.lsp_type_definitions
		mappings.document_symbol = bltn.lsp_document_symbols
		mappings.workspace_symbol = bltn.lsp_workspace_symbols
	end,
}
