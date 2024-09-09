return {
  "hrsh7th/nvim-cmp",
  enabled = require("tools").isenable(1),
  dependencies = {
    -- 补全核心插件
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    -- For luasnip users.
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    -- 片段提供
    "rafamadriz/friendly-snippets",
    -- 添加图标
    "onsails/lspkind.nvim",
  },
  event = "VeryLazy",
  config = function()
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local cmp = require("cmp")
    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          -- can also be a function to dynamically calculate max width such as
          -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default

          -- The function below will be called before any actual modifications from lspkind
          -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
          before = function(entry, vim_item)
            return vim_item
          end,
        }),
      },
      -- 快捷键绑定
      mapping = {
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        -- 确认
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   elseif vim.fn["vsnip#available"](1) == 1 then
        --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
        --   elseif has_words_before() then
        --     cmp.complete()
        --   else
        --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        --   end
        -- end, { "i", "s" }),
        -- ["<S-Tab>"] = cmp.mapping(function()
        --   if cmp.visible() then
        --     cmp.select_prev_item()
        --   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        --     feedkey("<Plug>(vsnip-jump-prev)", "")
        --   end
        -- end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        -- 以下插件作为前提：
        -- { 'L3MON4D3/LuaSnip' },
        -- { 'saadparwaiz1/cmp_luasnip' },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })
    -- load vscode snippet (friendly-snippet)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
