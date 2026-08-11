return {
  {
    "folke/flash.nvim",
    vscode = true,
    event = "VeryLazy",
    opts = {
      modes = {
        search = { enabled = true },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash Jump",
      },
    },
  },
}
