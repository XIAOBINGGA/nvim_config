return {
  "xiyaowong/nvim-transparent",
  lazy = false,
  config = function()
    require("transparent").setup({
      extra_groups = { -- table/string: additional groups that should be cleared
        "all"
      },
    })
  end
}
