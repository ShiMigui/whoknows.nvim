vim.g.mapleader = "\\" -- This is the key <LEADER>, change it to " " if you prefer using space

require("core.options")
require("core.lazy")
require("core.tools.terminal")

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exits INSERT mode" })
vim.keymap.set("n", "<leader>q", "<CMD>bd!<CR>", { desc = "Closes buffer" })

if vim.loop.os_getenv("XDG_SESSION_TYPE") ~= "wayland" or vim.loop.os_getenv("WAYLAND_DISPLAY") == nil then return end
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
	cache_enabled = 1,
}
