return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
  },
  config = function()
    -- vim.o.background = 'light'
    vim.cmd([[colorscheme catppuccin]])
  end,
}
