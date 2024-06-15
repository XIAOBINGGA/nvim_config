return {
  "williamboman/mason.nvim",
  event = "VeryLazy",
  enabled = true,
  config = function()
    require("mason").setup()
  end,
}
