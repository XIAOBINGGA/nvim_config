local symbols = require("tools").symbols
return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    "arkav/lualine-lsp-progress",
  },
  opts = {
    extensions = { "nvim-tree" },
    options = {
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "undotree", "diff", "Outline" },
    },
    sections = {
      lualine_b = { "branch", "diff" },
      lualine_c = {
        "filename",
        {
          "lsp_progress",
          spinner_symbols = {
            symbols.Dice1,
            symbols.Dice2,
            symbols.Dice3,
            symbols.Dice4,
            symbols.Dice5,
            symbols.Dice6,
          },
        },
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
