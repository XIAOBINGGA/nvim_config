-- Flutter/Dart 开发配置
-- 前置条件:
--   1. 安装 Flutter SDK 并加入 PATH(https://flutter.dev)
--   2. dart 的 LSP 由 flutter-tools 自动通过 flutter daemon 启动,无需手动装 dartls
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "dart" } },
  },
  {
    "akinsho/flutter-tools.nvim",
    -- 只在打开 dart 文件时才加载,避免每次启动都拉起 flutter 相关进程拖慢速度
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      -- 注意: 不要设置 flutter_lookup_cmd!plenary 会直接 spawn "flutter",
      -- Windows 上 libuv 无法执行无扩展名的批处理包装器而报 ENOENT,
      -- 该错误会在 dart FileType 事件中抛出并中断后续 autocmd(导致 treesitter 高亮不启动)。
      -- 不设置时走 exepath("flutter") 默认路径,能正确解析到 flutter.bat
      flutter_path = nil, -- 默认从 PATH 查找 flutter,也可写死如 "C:/flutter/bin/flutter.bat"
      fvm = false, -- 如用 fvm 管理版本则改为 true
      lsp = {
        -- lsp.color 已废弃,document colors 改由其他插件(如 snacks.nvim)提供
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
      widget_guides = {
        enabled = true, -- 缩进处显示 widget 子树参考线
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "// ",
      },
      debugger = {
        enabled = true, -- 需要 nvim-dap
        run_via_dap = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = "tabedit", -- 运行日志在 tab 中打开
      },
      outline = {
        open_cmd = "30vnew", -- 符号大纲
      },
      decorations = {
        statusline = {
          app_version = true, -- 状态栏显示 App 版本
          device = true, -- 状态栏显示当前设备
        },
      },
    },
  },
}
