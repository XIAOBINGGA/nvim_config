return {
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      -- code
      -- local lspconfig = require("lspconfig")
      local masonlspconfig = require("mason-lspconfig")
      masonlspconfig.setup({
        ensure_installed = { "ts_ls", "lua_ls", "cssls", "html", "jsonls", "rescriptls", "marksman", "tailwindcss" },
      })
    end,
  },
}
