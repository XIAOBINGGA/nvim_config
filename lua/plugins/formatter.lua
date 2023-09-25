return {
  "nvimdev/guard.nvim",
  dependencies = {
    "nvimdev/guard-collection"
  },
  config = function()
    local ft = require('guard.filetype')
    ft('typescript,javascript,typescriptreact'):fmt('prettier')
    require("guard").setup({

    })
  end
}
