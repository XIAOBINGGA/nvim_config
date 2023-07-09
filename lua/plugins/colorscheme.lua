local tools = require('tools')
return {
  tools.url_replace('navarasu/onedark.nvim'),
  config = function()
    require('onedark').load()
  end
}
