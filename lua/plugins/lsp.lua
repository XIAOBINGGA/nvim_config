local servers = {
  lua_ls = require("lsp.lua"),
  ts_ls = require("lsp.ts"),
  cssls = require("lsp.css"),
  html = require("lsp.html"),
  jsonls = require("lsp.json"),
  dartls = require("lsp.dart"),
  rescriptls = require("lsp.res"),
  marksman = require("lsp.md"),
  tailwindcss = require("lsp.tailwindcss"),
}
return {
  {
    "williamboman/mason.nvim",
    event = "BufEnter",
    enabled = require("tools").isenable(1),
    config = function()
      -- code
      local mason = require("mason")
      mason.setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    event = "BufEnter",
    enabled = require("tools").isenable(1),
    config = function()
      local lspconfig = require("lspconfig")
      local masonlspconfig = require("mason-lspconfig")
      masonlspconfig.setup({
        ensure_installed = { "ts_ls", "lua_ls", "cssls", "html", "jsonls", "rescriptls", "marksman", "tailwindcss" },
      })
      local setup_handlers = {}
      for name, config in pairs(servers) do
        if config ~= nil and type(config) == "table" then
          if name == "dartls" then
          -- config.on_setup(lspconfig[name])
          else
            setup_handlers[name] = function()
              config.on_setup(lspconfig[name])
            end
          end
        end
      end
      require("mason-lspconfig").setup_handlers(setup_handlers)
    end,
  },
}
