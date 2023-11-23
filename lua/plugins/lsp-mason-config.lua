local servers = {
  lua_ls = require("lsp.lua"),
  tsserver = require("lsp.ts"),
  cssls = require("lsp.css"),
  html = require("lsp.html"),
  jsonls = require("lsp.json"),
  dartls = require("lsp.dart")
}

return {
  "williamboman/mason-lspconfig.nvim",
  event = "VeryLazy",
  enabled = true,
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "tsserver", "cssls", "html", "jsonls" }
    }
    local lspconfig = require("lspconfig")
    local setup_handlers = {}
    for name, config in pairs(servers) do
      if config ~= nil and type(config) == 'table' then
        if name == 'dartls' then
          -- config.on_setup(lspconfig[name])
        else
          setup_handlers[name] = function()
            config.on_setup(lspconfig[name])
          end
        end
      end
    end
    require("mason-lspconfig").setup_handlers(setup_handlers)
  end
}
