return {
  "akinsho/toggleterm.nvim",
  version = "*",
  enabled = require("tools").isenable(0),
  config = true,
  -- config = function ()
  -- end,
  opts = {
    open_mapping = [[<c-\>]],
    direction = "tab",
    start_in_insert = true,
  },
}
