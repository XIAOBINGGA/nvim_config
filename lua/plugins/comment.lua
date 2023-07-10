local tools = require('tools')
return {
  tools.url_replace('numToStr/Comment.nvim'),
  config = function()
    require('Comment').setup()
  end
}
