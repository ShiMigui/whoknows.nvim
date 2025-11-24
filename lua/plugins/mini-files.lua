return {
  "nvim-mini/mini.files",
  dependencies = "nvim-mini/mini.nvim",
  opts = {},
  keys = {
    { "<leader>b", require("mini.files").open, mode = { "n", "i", "v" } }
  }
}

