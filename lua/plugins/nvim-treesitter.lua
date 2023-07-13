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
    })
  end
}
