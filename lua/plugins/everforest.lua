-- Everforest 主题（sainnhe 原版）
-- 柔绿系护眼配色,支持 treesitter / LSP semantic tokens
-- 临时切回旧主题: :colorscheme tokyonight
return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    init = function()
      -- 暗色模式(回到深色);改 "light" 即切浅色
      vim.o.background = "dark"
      -- soft / medium / hard,背景明度不同;dark 下 soft=#333C43 最亮最柔和
      vim.g.everforest_background = "soft"
      vim.g.everforest_enable_italic = true
      -- UI 元素(状态栏/浮动窗口/选中区)使用低对比度,整体更柔和
      vim.g.everforest_ui_contrast = "low"
      -- 0:不透明 1:全透明 2:仅侧边栏/浮窗透明
      vim.g.everforest_transparent_background = 0
      -- 不做行级诊断底色高亮(会把报错/警告整行染成红/黄色,视觉太闹)
      vim.g.everforest_diagnostic_text_highlight = 0
    end,
    config = function()
      vim.cmd("colorscheme everforest")
    end,
  },
  -- 让 LazyVim 默认配色指向 everforest(启动加载失败时的兜底)
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "everforest" },
  },
}
