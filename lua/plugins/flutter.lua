return {
  "akinsho/flutter-tools.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(0),
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  opts = {
    lsp = {
      on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybings").mapLsp(buf_set_keymap)
        --
        --   -- 禁用格式化功能，交给专门插件插件处理
        --   -- client.resolved_capabilities.document_formatting = false
        --   -- client.resolved_capabilities.document_range_formatting = false
      end,
    },
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
  },
}
