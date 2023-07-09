local tools = require('tools')
return {
  tools.url_replace('nvim-telescope/telescope.nvim'),
  dependencies = { 
    tools.url_replace('nvim-lua/plenary.nvim'),
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = require('keybings').telescopeList
      }
    })
  end
}
