return {
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
}

