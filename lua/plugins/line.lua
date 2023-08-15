return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('lualine').setup({
      options = {
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators = { left = " ", right = "" },
      }
    })
  end
}
