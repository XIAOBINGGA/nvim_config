return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  enabled = true,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      config.install_info.url = config.install_info.url:gsub("https://github.com/", "git@github.com:")
    end
    require 'nvim-treesitter.install'.compilers = { 'zig' }
    require 'nvim-treesitter.configs'.setup({
      ensure_installed = {
        "c",
        "go",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "cpp",
        "css",
        "dart",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "html",
        "javascript",
        "json",
        "json5",
        "jsdoc",
        "jsonc",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "meson",
        "python",
        "rust",
        "scss",
        "sql",
        "typescript",
        "tsx",
        "vue",
        "yaml",
        "zig"
      },
      -- auto_install = true,
      -- highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = false,
      -- },
      rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 8888, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
      },
      incremental_selection = {
        enable = true,
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
  end
}
