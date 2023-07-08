local tools = require('tools')
return {
  tools.url_replace('nvim-tree/nvim-tree.lua'),
  config = function()
    require("nvim-tree").setup()
  end
}
