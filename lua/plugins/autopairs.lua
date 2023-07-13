local tools = require('tools')
return {
  tools.url_replace('windwp/nvim-autopairs'),
  event = "InsertEnter",
  opts = {}
}
