-- neo-tree 文件树窗口位置
-- position 可选: "left"(默认) / "right" / "top" / "bottom" / "float"(居中浮动)
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = opts.window or {}

    -- 关闭文件树的 git 扫描(git status)
    opts.enable_git_status = false

    -- 浮窗(居中浮动)
    opts.window.position = "float"
    opts.popup = opts.popup or {}
    opts.popup.size = opts.popup.size or {}
    opts.popup.size.width = 70
    opts.popup.size.height = "80%"
    opts.popup.position = opts.popup.position or {}
    opts.popup.position.col = "50%"
    opts.popup.position.row = "50%"
    opts.popup.border = "rounded"

    -- 如果想改回侧边栏,注释掉上面的 float 相关,改用:
    -- opts.window.position = "left"
    -- opts.window.width = 30
  end,
}
