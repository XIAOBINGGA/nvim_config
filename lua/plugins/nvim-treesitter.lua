return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  enabled = require("tools").isenable(3),
  config = function()
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      config.install_info.url = config.install_info.url:gsub("https://github.com/", "git@github.com:")
      config.help = nil
    end
    require("nvim-treesitter.install").compilers = { "zig" }
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- "vidoc",
        "c",
        "regex",
        "lua",
        "css",
        "html",
        "rescript",
        "javascript",
        "json",
        "markdown",
        "markdown_inline",
        "scss",
        "typescript",
        "tsx",
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        -- disable = { "dart" },
        disable = function(lang, buf)
          if lang == "dart" then
            return true
          end
          local max_filesize = 300 * 1024 -- 1kb = 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
      incremental_selection = {
        enable = true,
        disable = { "dart" },
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
      -- 启用代码缩进模块 (=)
      indent = {
        enable = true,
      },
    })
  end,
}
