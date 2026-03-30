local mapping = require("core.mapping")
local custom, lsp, workspace = mapping.custom, mapping.lsp, mapping.workspace

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
		defaults = { file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" } },
	},
	config = function(_, opts)
		local tlp = require("telescope")
		tlp.setup(opts)
		tlp.load_extension("fzf")

		local b = require("telescope.builtin")

		local function find_neovim()
			b.find_files({ cwd = vim.fn.stdpath("config") })
		end
		custom.buffers = { lhs = "<leader>fb", rhs = b.buffers, desc = "Buffers" }
		custom.help_tags = { lhs = "<leader>fh", rhs = b.help_tags, desc = "Help tags" }
		custom.live_grep = { lhs = "<leader>fg", rhs = b.live_grep, desc = "Live grep" }
		custom.find_files = { lhs = "<leader>ff", rhs = b.find_files, desc = "Find files" }
		custom.find_neovim = { lhs = "<leader>fn", rhs = find_neovim, desc = "Find Neovim config" }

		lsp.definition.rhs = b.lsp_definitions
		lsp.references.rhs = b.lsp_references
		lsp.implementation.rhs = b.lsp_implementations
		lsp.type_definition.rhs = b.lsp_type_definitions

		workspace.symbol.rhs = b.lsp_workspace_symbols
		workspace.document_symbol.rhs = b.lsp_document_symbols
	end,
}
