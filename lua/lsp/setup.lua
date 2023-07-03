local status, lspinstaller = pcall(require, "nvim-lsp-installer")
if not status then
  vim.notify("没有找到 nvim-lsp-installer")
  return
end
local statusconfig, lspconfig = pcall(require, "lspconfig")
if not statusconfig then
  vim.notify("没有找到 lspconfig")
  return
end
lspinstaller.setup({
  -- 自动安装 Language Servers
  automatic_installation = true
})
local servers = {
  -- sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  lua_ls = require("lsp.config.lua"),   -- lua/lsp/config/lua.lua
  rescriptls = require("lsp.config.res"),
  -- bashls = require("lsp.config.bash"),
  -- pyright = require("lsp.config.pyright"),
  html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  -- emmet_ls = require("lsp.config.emmet"),
  -- jsonls = require("lsp.config.json"),
  tsserver = require("lsp.config.ts")
  -- rust_analyzer = require("lsp.config.rust"),
  -- yamlls = require("lsp.config.yamlls"),
  -- remark_ls = require("lsp.config.markdown"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    -- 自定义初始化配置文件必须实现on_setup 方法
    config.on_setup(lspconfig[name])
  else
    -- 使用默认参数
    lspconfig[name].setup({})
  end
end
