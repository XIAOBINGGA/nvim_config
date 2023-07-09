local tools = require('tools')
local servers = {
				lua_ls = require("lsp.lua"),
}
return {
  tools.url_replace('neovim/nvim-lspconfig'),
  config = function ()
	  local lspconfig = require("lspconfig")
	  for name, config in pairs(servers) do
    if config ~= nil and type(config) == "table" then
        -- 自定义初始化配置文件必须实现on_setup 方法
        config.on_setup(lspconfig[name])
    else
        -- 使用默认参数
        lspconfig[name].setup({})
    end
end
  end
}
