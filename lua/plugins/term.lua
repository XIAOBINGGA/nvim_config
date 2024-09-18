return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  config = true,
  -- config = function ()
  -- end,
  opts = {
    open_mapping = [[<c-\>]],
    direction = "horizontal",
    start_in_insert = true,
  },
}
