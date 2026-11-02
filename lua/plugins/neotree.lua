-- neo-tree 文件树窗口位置
-- position 可选: "left"(默认) / "right" / "top" / "bottom" / "float"(居中浮动)
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}

    -- 浮动窗口(居中,类似 fzf 的样子)
    opts.window.position = "float"
    opts.window.float = {
      source = "last", -- 重新打开时回到上次目录
      relative = "editor",
      border = "rounded",
      width = 0.6, -- 屏宽的 60%
      height = 0.7, -- 屏高的 70%
      col = 0.5, -- 水平居中
      row = 0.5, -- 垂直居中
    }

    -- 如果想改成上下分栏,注释掉上面的 float 相关,改用:
    -- opts.window.position = "top"
    -- opts.window.width = 15 -- top/bottom 时 width 表示行数(高度)
    -- 或
    -- opts.window.position = "bottom"
  end,
}
