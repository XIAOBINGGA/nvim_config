return {
  "folke/zen-mode.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      width = 0.8, -- 窗口宽度占屏幕宽度的比例
      options = {
        signcolumn = "no", -- 隐藏符号列
        number = false, -- 隐藏行号
        relativenumber = false, -- 隐藏相对行号
        cursorline = false, -- 隐藏光标所在行的高亮
        cursorcolumn = false, -- 隐藏光标所在列的高亮
        foldcolumn = "0", -- 隐藏折叠列
        list = false, -- 隐藏列表字符
      },
    },
  },
  keys = {
    { "<leader>z", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
  },
}
