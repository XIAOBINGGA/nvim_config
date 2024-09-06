return {
  "nvimdev/lspsaga.nvim",
  enabled = require("tools").isenable(1),
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
