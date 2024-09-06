return {
  "nvimdev/lspsaga.nvim",
  enabled = require("tools").isenable(0),
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
