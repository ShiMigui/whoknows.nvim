vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

local o = vim.o

o.number = true
o.relativenumber = true
o.cursorline = true
o.termguicolors = true
o.signcolumn = "yes"
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.showmode = false

o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.backspace = "indent,eol,start"

o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"
o.swapfile = false

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.clipboard = "unnamedplus"
o.mouse = "a"

o.splitright = true
o.splitbelow = true
o.splitkeep = "screen"

o.updatetime = 200
o.timeoutlen = 300
o.ttimeoutlen = 0

o.wildmode = "longest:full,full"
o.completeopt = "menu,menuone,noinsert,noselect"
o.pumheight = 10

vim.fn.mkdir(o.undodir, "p")
