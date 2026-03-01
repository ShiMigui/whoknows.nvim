local opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } }
return { "folke/lazydev.nvim", ft = "lua", opts = opts }
