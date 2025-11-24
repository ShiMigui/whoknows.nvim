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
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
			vim.keymap.set(
				"n",
				"<leader>f.",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Telescope fuzzy find in buffer" }
			)
		end,
	},
	{
		"nvim-mini/mini.files",
		dependencies = "nvim-mini/mini.nvim",
		opts = {},
		keys = {
			{ "<leader>b", require("mini.files").open, mode = { "n", "i", "v" } },
		},
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
