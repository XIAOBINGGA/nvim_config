return {
  -- nvim v0.8.0
  {
    "kdheepak/lazygit.nvim",
    enabled = require("tools").isenable(1),
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
  {
    "NeogitOrg/neogit",
    enabled = require("tools").isenable(1),
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    enabled = require("tools").isenable(1),
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()
    end,
  },
}
