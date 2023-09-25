return {
  "mhartington/formatter.nvim",
  config = function()
    require("formatter").setup({
      filetype = {
        javascript = {
          function()
            return {
              exe = "prettier",
              args = {
                -- "--config-path "
                --   .. os.getenv("XDG_CONFIG_HOME")
                --   .. "/stylua/stylua.toml",
                "-",
              },
              -- stdin = true,
            }
          end,
        }
      },
    })
  end
}
