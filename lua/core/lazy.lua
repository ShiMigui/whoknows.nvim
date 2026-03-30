local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

local maps = require("core.mapping")
for name, map in pairs(maps.list) do
	if map.rhs then
		vim.keymap.set(map.mode, map.lhs, map.rhs, map.opts)
	else
		error("Keymap for '" .. name .. "' have no `rhs` associated")
	end
end
