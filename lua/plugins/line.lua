return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  config = function()
    local status, lualine = pcall(require, "lualine")
    if not status then
      vim.notify("没有找到 lualine")
      return
    end
    lualine.setup({
      options = {
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = { left = " ", right = " " },
      },
      extensions = { "neo-tree", "toggleterm", "lazy" },
      sections = {
        lualine_c = {
          "filename",
        },
        lualine_x = {
          "filesize",
          {
            "fileformat",
            symbols = {
              unix = "", -- e712
              dos = "", -- e70f
              mac = "", -- e711
            },
          },
          "encoding",
          "filetype",
        },
      },
    })
  end,
}
