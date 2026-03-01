local map = require('core.actions').set

return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
    },
  },
  config = function(_, opts)
    local gs = require("gitsigns")

    gs.setup(opts)

    map("n", "]h", gs.next_hunk, "Next hunk" )
    map("n", "[h", gs.prev_hunk, "Previous hunk" )
    map("n", "<leader>hs", gs.stage_hunk, "Stage hunk" )
  end,
}
