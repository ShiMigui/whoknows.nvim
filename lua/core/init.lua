vim.g.mapleader = "\\" -- This is the key <LEADER>, change it to " " if you prefer using space

require("core.options")
require("core.lazy")

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exits INSERT mode" })
vim.keymap.set("n", "<leader>q", "<CMD>bd!<CR>", { desc = "Closes buffer" })
vim.keymap.set("n", "<leader>Q", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Closes all others buffers" })


if vim.loop.os_getenv("XDG_SESSION_TYPE") ~= "wayland" or vim.loop.os_getenv("WAYLAND_DISPLAY") == nil then return end
vim.g.clipboard = {
	name = "wl-clipboard",
	copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
	paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
	cache_enabled = 1,
}
