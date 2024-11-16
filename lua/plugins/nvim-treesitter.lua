return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "rescript",
    },
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end
    --NOTE:使用ssh进行安装保证在网络有波动的时候可以使用正常
    for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
      config.install_info.url = config.install_info.url:gsub("https://github.com/", "git@github.com:")
    end
    --NOTE:使用zig进行构建
    require("nvim-treesitter.install").compilers = { "zig" }
    require("nvim-treesitter.configs").setup(opts)
  end,
}
