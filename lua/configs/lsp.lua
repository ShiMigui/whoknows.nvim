return {
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    -- keymap("n", "<leader>gf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer") -- Since we have conform it is unnecessary
  end
}
