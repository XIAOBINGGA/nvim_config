return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>ut", "<cmd>lua require('undotree').toggle()<cr>", desc = "undo tree" },
  },
}
