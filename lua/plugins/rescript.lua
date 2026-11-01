-- ReScript 语言支持
-- LSP 需要自行安装(mason registry 里没有 rescript,故 mason = false):
--   npm i -g @rescript/language-server
--   npm i -g rescript  (可选:装编译器,lsp 增量类型检查也够用)
return {
  -- 文件类型识别:.res / .resi
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.filetype.add({
        extension = {
          res = "rescript",
          resi = "rescript",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rescriptls = {
          mason = false, -- registry 没有,用 npm 自己装的
          -- 注意:该服务器从 settings.rescript.settings 读取配置,
          -- 写在 init_options 里不生效(会弹 "Start a build?" 询问)
          settings = {
            rescript = {
              settings = {
                askToStartBuild = false,
                allowBuiltInFormatter = true,
                codeLens = true,
                inlayHints = { enable = true },
                incrementalTypechecking = { enable = true, acrossFiles = true },
                cache = { projectConfig = { enabled = true } },
              },
            },
          },
        },
      },
    },
  },
-- rescript 的 treesitter parser 无法自动安装(GitHub 直连不通,TSInstall 会卡死)
-- 手动安装步骤见 FEATURES.md「ReScript 环境搭建」第 3 节
}
