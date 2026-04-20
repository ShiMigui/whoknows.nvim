local core = require("keymaps").core
core.next_buffer.cmd = "BufferLineCycleNext"
core.prev_buffer.cmd = "BufferLineCyclePrev"

return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {},
}
