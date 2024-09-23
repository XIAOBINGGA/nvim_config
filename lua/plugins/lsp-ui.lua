return {
  "nvimdev/lspsaga.nvim",
  enabled = require("tools").isenable(1),
  event = "BufEnter",
  config = function()
    vim.diagnostic.config({
      virtual_text = false,
    })
    require("lspsaga").setup({
      diagnostic = {
        diagnostic_only_current = true,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
