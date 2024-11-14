return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  rocks = {
    enabled = false,
  },
  enabled = false,
  keys = {
    -- { "<leader>fp", "<cmd>Format<cr>", desc = "format files" },
  },
  config = function()
    -- Utilities for creating configurations
    local util = require("formatter.util")

    -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
    require("formatter").setup({
      -- Enable or disable logging
      logging = false,
      -- Set the log level
      log_level = vim.log.levels.WARN,
      -- All formatter configurations are opt-in
      lua = {
        require("formatter.filetypes.lua").stylua,
      },
      filetype = {
        dart = {
          require("formatter.filetypes.dart").dartformat,
        },
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        less = {
          function(parser)
            if not parser then
              return {
                exe = "prettier",
                args = {
                  "--stdin-filepath",
                  util.escape_path(util.get_current_buffer_file_path()),
                },
                stdin = true,
                try_node_modules = true,
              }
            end

            return {
              exe = "prettier",
              args = {
                "--stdin-filepath",
                util.escape_path(util.get_current_buffer_file_path()),
                "--parser",
                parser,
              },
              stdin = true,
              try_node_modules = true,
            }
          end,
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}
