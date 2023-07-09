local tools = require('tools')
return {
  tools.url_replace('williamboman/nvim-lsp-installer'),
  config = function()
    require('nvim-lsp-installer').setup({
      -- 自动安装 Language Servers
      automatic_installation = true
    })
  end
}
