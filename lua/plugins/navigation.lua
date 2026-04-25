local utils = require("utils")

local keymaps = require("keymaps")
local workspaces = keymaps.workspace
local custom = keymaps.custom
local core = keymaps.core
local lsp = keymaps.lsp

core.next_buffer.cmd = "BufferLineCycleNext"
core.prev_buffer.cmd = "BufferLineCyclePrev"

local ignore = require("settings").core.file_explorer_ignore

local inverted_ignore = utils.invert_table(ignore)

core.file_explorer.cmd = "lua MiniFiles.open()"

return {
	-- BUFFERS
	{ "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {} },

	-- FILE EXPLORER
	{
		"nvim-mini/mini.files",
		version = "*",
		opts = {
			windows = { preview = true, width_preview = 40 },
			content = {
				filter = function(e)
					if e.fs_type == "directory" then
						e.name = e.name .. "/"
					end
					return not inverted_ignore[e.name]
				end,
			},
			mappings = { close = core.file_explorer.lhs },
		},
	},

	-- FILE EXPLORER
	{
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
			defaults = { file_ignore_patterns = ignore },
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")

			local b = require("telescope.builtin")

			custom.buffers = { lhs = "<leader>fb", desc = "Buffers", rhs = b.buffers }
			custom.help_tags = { lhs = "<leader>fh", desc = "Help tags", rhs = b.help_tags }
			custom.live_grep = { lhs = "<leader>fg", desc = "Live grep", rhs = b.live_grep }
			custom.find_files = { lhs = "<leader>ff", desc = "Find files", rhs = b.find_files }
			custom.find_neovim = { lhs = "<leader>fn", desc = "Find Neovim config" }
			function custom.find_neovim.rhs()
				b.find_files({ cwd = vim.fn.stdpath("config") })
			end

			lsp.definition.rhs = b.lsp_definitions
			lsp.references.rhs = b.lsp_references
			lsp.implementation.rhs = b.lsp_implementations
			lsp.type_definition.rhs = b.lsp_type_definitions

			workspaces.symbol.rhs = b.lsp_workspace_symbols
			workspaces.document_symbol.rhs = b.lsp_document_symbols
		end,
	},
}
