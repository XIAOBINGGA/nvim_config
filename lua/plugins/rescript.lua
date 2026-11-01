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
          settings = {
            rescript = {
              settings = {
                inlayHints = { enable = true },
              },
            },
          },
        },
      },
    },
  },
  -- rescript 的 treesitter parser 无法自动安装(启动时联网下载会卡死,见 FEATURES.md 网络说明)
  -- 需手动安装,见仓库 README 或手动 clone 编译
}
