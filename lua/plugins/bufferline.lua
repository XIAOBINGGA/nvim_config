local symbols = require('tools').symbols
return {
  'akinsho/bufferline.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = 'VeryLazy',
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
  config = function(_, opts)
    require('bufferline').setup(opts)
  end,
  keys = {
    { "<leader>bc", ":BufferLinePickClose<CR>", desc = "pick close", silent = true, noremap = true },
    { "<leader>bb", ":Telescope buffers<CR>", desc = "buffer list", silent = true, noremap = true },
    -- <esc> is added in case current buffer is the last
    { "<leader>bd", ":bdelete!<CR><Esc>", desc = "close current buffer", silent = true, noremap = true },
    { "<leader>bh", ":BufferLineCyclePrev<CR>", desc = "prev buffer", silent = true, noremap = true },
    { "<leader>bl", ":BufferLineCycleNext<CR>", desc = "next buffer", silent = true, noremap = true },
    { "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "close others", silent = true, noremap = true },
    { "<leader>bp", ":BufferLinePick<CR>", desc = "pick buffer", silent = true, noremap = true },
  },
}
