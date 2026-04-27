vim.g.mapleader = "\\"
vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/site")

require("core")

require("keymaps.apply")
