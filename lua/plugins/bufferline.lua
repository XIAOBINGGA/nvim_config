return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  config = function()
    require('bufferline').setup({
      options = {
        numbers = 'id',
      }
    })
  end
}
