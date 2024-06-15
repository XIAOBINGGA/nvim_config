return {
  "sainnhe/everforest",
  lazy = false,
  priority = 1000,
  opts = {
    background = "soft",
  },
  config = function()
    vim.cmd([[colorscheme everforest]])
  end,
}
