return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  -- opts = {
  --   extensions = { "nvim-tree" },
  --   options = {
  --     theme = "auto",
  --     -- section_separators = { left = " ", right = "" },
  --     -- component_separators = { left = " ", right = "" },
  --     disabled_filetypes = { "undotree", "diff", "Outline" },
  --   },
  --   sections = {
  --     lualine_b = { "branch", "diff" },
  --     lualine_c = {
  --       "filename",
  --     },
  --     lualine_x = {
  --       "filesize",
  --       {
  --         "fileformat",
  --         symbols = { unix = symbols.Unix, dos = symbols.Dos, mac = symbols.Mac },
  --       },
  --       "encoding",
  --       "filetype",
  --     },
  --   },
  -- },
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
      extensions = { "nvim-tree", "toggleterm" },
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
-- 如果找不到lualine 组件，就不继续执行
