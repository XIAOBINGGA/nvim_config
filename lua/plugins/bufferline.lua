local tools = require('tools')
return {
  tools.url_replace('akinsho/bufferline.nvim'),
  config = function()
    require('bufferline').setup({
      options = {
        numbers = 'id'
      }
    })
  end
}
