return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      config.install_info.url = config.install_info.url:gsub("https://github.com/", "git@github.com:")
    end
    require 'nvim-treesitter.install'.compilers = { 'zig' }
    require 'nvim-treesitter.configs'.setup({
     ensure_installed = { "c", "json", "html", "css", "vim", "lua", "javascript", "typescript", "tsx" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
