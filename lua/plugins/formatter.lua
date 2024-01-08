return {
  "mhartington/formatter.nvim",
  event = 'VeryLazy',
  config = function()
    local util = require "formatter.util"
    require("formatter").setup({
      filetype = {
        javascriptreact = {
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
          end
        },
        typescript = {
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
          end
        },
        javascript = {
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
          end
        }
      },
    })
  end
}
