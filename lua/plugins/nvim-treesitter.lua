return {
  "nvim-treesitter/nvim-treesitter",
  vscode = true,
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
