local symbols = require("tools").symbols
return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    extensions = { "nvim-tree" },
    options = {
      theme = "auto",
      section_separators = { left = " ", right = " " }, 
      component_separators = { left = " ", right = " " }, 
      disabled_filetypes = { "undotree", "diff", "Outline" },
    },
    sections = {
      lualine_b = { "branch", "diff" },
       lualine_c = {
        "filename",
      },
      lualine_x = {
        "filesize",
        {
          "fileformat",
          symbols = { unix = symbols.Unix, dos = symbols.Dos, mac = symbols.Mac },
        },
        "encoding",
        "filetype",
      },
    },
  }
}
