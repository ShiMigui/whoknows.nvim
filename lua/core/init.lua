vim.g.mapleader = "\\" -- This is the key <LEADER>, change it to " " if you prefer using space

local keymap = require("configs.keymap")
keymap("n", "gd", vim.lsp.buf.definition, "Go to definition")
keymap("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
keymap("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
keymap("n", "grr", vim.lsp.buf.references, "Go to references")
keymap("n", "K", vim.lsp.buf.hover, "Hover docs")
keymap("n", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
keymap("n", "grn", vim.lsp.buf.rename, "Rename symbol")
keymap("n", "gca", vim.lsp.buf.code_action, "Code action")
keymap("n", "<leader>gwa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
keymap("n", "<leader>gwr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
keymap("n", "<leader>gwl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders")

keymap("n", "<ESC>", "<CMD>nohlsearch<CR>", "Disables highlighting search")
keymap("i", "jk", "<ESC>", "Exits INSERT mode")
keymap("n", "<leader>q", "<CMD>bd!<CR>", "Closes buffer")
keymap("n", "<leader>Q", function()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and buf ~= current then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, "Closes all others buffers")

require("core.options")
require("core.lazy")

if vim.loop.os_getenv("XDG_SESSION_TYPE") ~= "wayland" or not vim.loop.os_getenv("WAYLAND_DISPLAY") then return end
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = { ["+"] = "wl-copy", ["*"] = "wl-copy" },
  paste = { ["+"] = "wl-paste", ["*"] = "wl-paste" },
  cache_enabled = 1,
}
