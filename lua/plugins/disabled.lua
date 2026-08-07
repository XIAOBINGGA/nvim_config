return {
  -- 禁用 LSP 服务
  { "neovim/nvim-lspconfig", enabled = false },
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  -- 禁用补全
  { "hrsh7th/nvim-cmp", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "hrsh7th/cmp-nvim-lua", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  -- 禁用 UI 相关
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "folke/noice.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "folke/edgy.nvim", enabled = false },
  { "folke/twilight.nvim", enabled = false },
  { "folke/zen-mode.nvim", enabled = false },
  -- 禁用 lint & format (由 VSCode 处理)
  { "mfussenegger/nvim-lint", enabled = false },
  { "stevearc/conform.nvim", enabled = false },
}
