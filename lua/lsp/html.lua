local opts = {
  flags = {
    debounce_text_changes = 150,
  },
  -- make inlay hints work
  init_options = {
    hostInfo = "neovim",
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },

  on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
      vim.notify("加载 lspconfig keybing")
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    require("config.keymaps").mapLsp(buf_set_keymap)
  --   -- 绑定快捷键
  --   require("keybings").mapLSP(buf_set_keymap)
  --
  --   -- 禁用格式化功能，交给专门插件插件处理
  --   -- client.resolved_capabilities.document_formatting = false
  --   -- client.resolved_capabilities.document_range_formatting = false
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
