return {
  -- 重新启用 gitsigns,60 秒刷新一次,不做高频实时扫描
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      update_debounce = 60000, -- 60s 扫描一次
    },
  },
}
