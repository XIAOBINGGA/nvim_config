return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  config = function()
    require("Comment").setup()
  end,
}
