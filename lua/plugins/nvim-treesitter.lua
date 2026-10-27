return {
  "nvim-treesitter/nvim-treesitter",
  vscode = true,
  -- 覆盖 LazyVim 默认的列表并集合并，使下方 ensure_installed 完全替换默认列表
  -- （否则 LazyVim 自带的 lua/markdown/markdown_inline 等仍会被合并进来）
  opts_extend = {},
  opts = {
    -- VSCode 中高亮由 VSCode 负责，关闭 treesitter 高亮
    -- 仅安装 parser 供 mini.ai 的函数/参数文本对象使用
    highlight = { enable = false },
    ensure_installed = {
      "bash",
      "css",
      "dart",
      "html",
      "javascript",
      "json",
      "jsonc",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
}
