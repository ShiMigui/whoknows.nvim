local maps = require("core.keymap")
local config = require("config")

return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
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
			file_ignore_patterns = config.ignore_files,
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")

			local b = require("telescope.builtin")
			local function find_config()
				b.find_files({ cwd = vim.fn.stdpath("config"), prompt_title = "Neovim Config" })
			end

			maps["help tags"] = { leader = "fh", rhs = b.help_tags }
			maps["find files"] = { leader = "ff", rhs = b.find_files }
			maps["recent files"] = { leader = "fr", rhs = b.oldfiles }
			maps["find with live grep"] = { leader = "fg", rhs = b.live_grep }
			maps["current buffer search"] = { leader = "fs", rhs = b.current_buffer_fuzzy_find }
			maps["find configuration files"] = { leader = "fn", rhs = find_config }

			maps["go to definition"].rhs = b.lsp_definitions
			maps["go to references"].rhs = b.lsp_references
			maps["go to implementation"].rhs = b.lsp_implementations
			maps["list diagnostics"].rhs = b.diagnostics
			maps["type definition"] = { leader = "gt", rhs = b.lsp_type_definitions }
			maps["document symbols"] = { leader = "ds", rhs = b.lsp_document_symbols }
			maps["workspace symbols"] = { leader = "ws", rhs = b.lsp_workspace_symbols }

			maps["git status"] = { leader = "gs", rhs = b.git_status }
			maps["git commits"] = { leader = "gc", rhs = b.git_commits }
			maps["git buffer commits"] = { leader = "gb", rhs = b.git_bcommits }
			maps["git branches"] = { leader = "gB", rhs = b.git_branches }
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		opts = {
			theme = "dragon",
			compile = true,
			undercurl = true,
			transparent = true,
			colors = { theme = { all = { ui = { bg_gutter = "none", bg = "none" } } } },
			overrides = function(colors)
				local ui, syn = colors.theme.ui, colors.theme.syn

				return {
					["@comment"] = { italic = true, fg = syn.comment },
					["@keyword"] = { italic = true, fg = syn.keyword },
					["@function"] = { bold = true, fg = syn.fun },
					["@type"] = { italic = false, fg = syn.type },

					FloatBorder = { fg = ui.float.fg_border, bg = "none" },
					CursorLine = { bg = ui.bg_p1 },
					NormalFloat = { bg = "none" },
				}
			end,
		},
		config = function(_, opts)
			require("kanagawa").setup(opts)
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{ "akinsho/bufferline.nvim", opts = {} },
}
