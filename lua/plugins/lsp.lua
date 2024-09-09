local servers = {
  lua_ls = require("lsp.lua"),
  ts_ls = require("lsp.ts"),
  cssls = require("lsp.css"),
  html = require("lsp.html"),
  jsonls = require("lsp.json"),
  dartls = require("lsp.dart"),
  rescriptls = require("lsp.res"),
  marksman = require("lsp.md"),
}
return {
  {
    "williamboman/mason.nvim",
    -- event = 'VeryLazy',
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
        ensure_installed = { "lua_ls", "cssls", "html", "jsonls", "rescriptls", "marksman" },
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
      -- masonlspconfig.setup_handlers({
      --   ["lua_ls"] = function()
      --     -- code
      --     lspconfig.lua_ls.setup({
      --       settings = {
      --         Lua = {
      --           runtime = {
      --             -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      --             version = "LuaJIT",
      --             -- Setup your lua path
      --             path = runtime_path,
      --           },
      --           diagnostics = {
      --             -- Get the language server to recognize the `vim` global
      --             globals = { "vim" },
      --           },
      --           workspace = {
      --             -- Make the server aware of Neovim runtime files
      --             library = vim.api.nvim_get_runtime_file("", true),
      --             checkThirdParty = false,
      --           },
      --           -- Do not send telemetry data containing a randomized but unique identifier
      --           telemetry = {
      --             enable = false,
      --           },
      --         },
      --       },
      --       flags = {
      --         debounce_text_changes = 150,
      --       },
      --     })
      --   end,
      -- })
    end,
  },
}
