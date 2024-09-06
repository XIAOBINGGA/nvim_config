return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(0),
  config = function()
    require("Comment").setup()
  end,
}
