local tools = require('tools')
return {
  tools.url_replace('neovim/nvim-lspconfig'),
  config = function()
    vim.diagnostic.config({
      -- virtual_text = true,
      -- signs = true,
      -- 在输入模式下也更新提示，设置为 true 也许会影响性能
      update_in_insert = false
    })
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = " ",
      Info = " "
    }
  end
}
