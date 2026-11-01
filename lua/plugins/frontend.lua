-- 前端补充支持:HTML / CSS / SCSS / LESS
-- (TS/JS/React/Tailwind 由 extras 提供:lang.typescript / lang.tailwind)
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- HTML
        html = {},
        -- CSS / SCSS / LESS(vscode-css-language-server 一个服务全包)
        cssls = {},
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp", -- vscode-html-language-server
        "css-lsp", -- vscode-css-language-server(css/scss/less)
      },
    },
  },
  -- Emmet:缩写展开 HTML/CSS,如 div.container>p*3 + <C-y>, → 完整结构
  -- 注意:emmet-language-server 是 npm 的 LSP 服务器而非 nvim 插件,
  -- 通过 lspconfig 挂载,mason 负责安装
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.emmet_language_server = {
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "pug", "typescriptreact", "vue",
        },
      }
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "emmet-language-server" })
    end,
  },
  -- 文件类型识别:sass/less 已内置,补充常见前端后缀
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed or {}, {
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "styled",
      })
    end,
  },
}
