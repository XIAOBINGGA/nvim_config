return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function ()
    local wk = require("which-key")
    wk.register({
      ["q"] = {
        q = {":q!<CR>", "强制退出"},
        w = {":wq<CR>", '保存退出'}
      }
    })
  end
}
