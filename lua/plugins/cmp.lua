return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    -- 补全核心插件
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    -- For luasnip users.
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip'
  },
  event = { "InsertEnter", "CmdlineEnter" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = cmp.config.sources(
      {
        -- { name = 'nvim_lsp' },
      -- 以下插件作为前提：
      -- { 'L3MON4D3/LuaSnip' },
      -- { 'saadparwaiz1/cmp_luasnip' },
        { name = 'luasnip' },
        {name = 'buffer'},
        {name = 'path'}
      }
      ),
    })
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end
}
