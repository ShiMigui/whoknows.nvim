vim.fn.full_filepath = function()
	return vim.fn.expand("%:p") ~= "" and vim.fn.expand("%:p") or "[No Name]"
end

return {
	{ "folke/tokyonight.nvim", config = function() vim.cmd([[colorscheme tokyonight-night]]) end },
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			options = {
				mode = "buffers",
				numbers = "none",
				close_command = "bdelete! %d",
				indicator = { style = "icon" },
				buffer_close_icon = "󰅖",
				modified_icon = "●",
				close_icon = "",
				separator_style = "slant",
				diagnostics = false,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_buffer_icons = true,
				always_show_bufferline = true,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				always_divide_middle = false,
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { vim.fn.full_filepath },
				lualine_x = { "filetype" },
				lualine_y = { "diagnostics" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { vim.fn.full_filepath },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		},
	},
}
