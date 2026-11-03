-- neo-tree 文件树窗口位置
-- position 可选: "left"(默认) / "right" / "top" / "bottom" / "float"(居中浮动)
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}

    -- 侧边栏(左侧)
    opts.window.position = "left"
    opts.window.width = 30

    -- 如果想改成上下分栏,注释掉上面的 float 相关,改用:
    -- opts.window.position = "top"
    -- opts.window.width = 15 -- top/bottom 时 width 表示行数(高度)
    -- 或
    -- opts.window.position = "bottom"
  end,
}
