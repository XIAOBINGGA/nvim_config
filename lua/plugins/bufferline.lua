local symbols = require("tools").symbols
return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  opts = {
    options = {
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      separator_style = "thin",
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      numbers = function(opts)
        return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
      end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and symbols.Error or (e == "warning" and symbols.Warn or symbols.Info)
          s = s .. n .. sym
        end
        return s
      end,
    },
  },
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Pick Close" },
    { "<leader>bk", "<Cmd>BufferLinePick<CR>", desc = "Pick" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}
