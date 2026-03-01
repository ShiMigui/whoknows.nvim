return {
  'stevearc/conform.nvim',
  opts = {
  formatters_by_ft = {
    lua = {"stylua"},
    javascript = {"prettier"},
    css = {"prettier"},
    scss = {"prettier"}
  }},
  config = function (_, opts)
    local cfm = require('conform')
    cfm.setup(opts)
    require('core.actions').format = cfm.format
  end
}
