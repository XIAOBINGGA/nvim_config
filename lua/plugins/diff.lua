-- ~/.config/nvim/lua/plugins/extra.lua
return {
  {
    "sindrets/diffview.nvim", -- 确保 diffview 已启用
    event = "VeryLazy",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
}
