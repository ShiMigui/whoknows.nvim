local keymap = require("configs.keymap")
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
			},
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
		},
		config = function(opts)
			local telescope, builtin = require("telescope"), require("telescope.builtin")

			telescope.setup(opts)
			telescope.load_extension("fzf")
			keymap("n", "<leader>ff", builtin.find_files, "Telescope find files")
			keymap("n", "<leader>fg", builtin.live_grep, "Telescope live grep")
			keymap("n", "<leader>fb", builtin.buffers, "Telescope buffers")
			keymap("n", "<leader>fh", builtin.help_tags, "Telescope help tags")
			keymap("n", "<leader>f.", builtin.current_buffer_fuzzy_find, "Telescope fuzzy find in buffer")
			keymap("n", "<leader>fc", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") .. "/lua", prompt_title = "Neovim Lua Config" })
			end, "Telescope Neovim config")
		end,
	},
	{
		"nvim-mini/mini.files",
		dependencies = "nvim-mini/mini.nvim",
		config = function()
			keymap({ "n", "i", "v" }, "<leader>b", require("mini.files").open, "Opens file explorer")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			size = 15,
			open_mapping = "<C-\\>",
			direction = "horizontal",
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
		},
	},
}
