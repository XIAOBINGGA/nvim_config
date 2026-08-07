return {
  -- 文本对象增强
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    opts = {
      n_lines = 500,
    },
  },

  -- surround 操作
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    opts = {
      mappings = {
        add = "ys",
        delete = "ds",
        find = "",
        find_left = "",
        highlight = "",
        replace = "cs",
        update_n_lines = "",
      },
    },
  },

  -- 快速注释
  {
    "nvim-mini/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "gc",
        comment_line = "gcc",
        comment_visual = "gc",
        textobject = "gc",
      },
    },
  },

  -- 自动配对
  {
    "nvim-mini/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },

  -- 拆分/合并
  {
    "nvim-mini/mini.splitjoin",
    event = "VeryLazy",
    opts = {
      mappings = {
        toggle = "gS",
        split = "",
        join = "",
      },
    },
  },

  -- 增强 . repeat
  { "tpope/vim-repeat", event = "VeryLazy" },

  -- 括号映射增强
  { "tpope/vim-unimpaired", event = "VeryLazy" },

  -- 自动检测缩进
  { "tpope/vim-sleuth", event = "VeryLazy" },

  -- 快速对齐
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "Easy Align" },
    },
  },
}
