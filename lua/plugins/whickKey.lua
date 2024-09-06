return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
}
