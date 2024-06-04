return {
  'akinsho/flutter-tools.nvim',
  event = "VeryLazy",
  enabled = true,
  ft = "dart",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  opts = {
    ui = {
      border = "rounded",
      notification_style = "nvim-notify",
    },
    decorations = {
      statusline = {
        app_version = true,
        device = true,
      },
    },
  }
}
