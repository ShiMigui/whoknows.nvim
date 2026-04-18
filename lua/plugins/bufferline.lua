local core = require("keymaps.core")
core.next_buffer.rhs = "<CMD>BufferLineCycleNext<CR>"
core.prev_buffer.rhs = "<CMD>BufferLineCyclePrev<CR>"

return { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = {} }
