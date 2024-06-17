return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      -- on_attach = list_keys,
      -- 完全禁止内置netrw
      -- disable_netrw = true,
      -- 不显示 git 状态图标
      git = {
        enable = true,
      },
      filters = {
        -- 隐藏 .文件
        dotfiles = true,
        -- 隐藏 node_modules 文件夹
        -- custom = { "node_modules" },
      },
      view = {
        -- 宽度
        width = 40,
        -- 也可以 'right'
        side = "left",
        -- 隐藏根目录
        -- hide_root_folder = false,
        -- 自定义列表中快捷键
        -- mappings = {
        --     -- 只用内置快捷键
        --     custom_only = true,
        --     list = list_keys
        -- },
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = "yes",
      },
      actions = {
        open_file = {
          -- 首次打开大小适配
          resize_window = true,
          -- 打开文件时关闭 tree
          quit_on_open = true,
        },
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
    })
  end,
}
