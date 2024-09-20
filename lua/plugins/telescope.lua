return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  keys = {
    {
      "<leader>tf",
      mode = { "n" },
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "find files",
    },
    {
      "<leader>tg",
      mode = { "n" },
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "live grep",
    },
    {
      "<leader>tp",
      mode = { "n" },
      "<cmd>Telescope project<CR>",
      desc = "project",
    },
    {
      "<leader>tb",
      mode = { "n" },
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "buffers",
    },
    {
      "<leader>th",
      mode = { "n" },
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "help tags",
    },
  },
  config = function()
    local status_telescope, telescope = pcall(require, "telescope")
    if not status_telescope then
      vim.notify("没有找到 telescope")
      return
    end
    telescope.setup({
      defaults = {
        layout_config = {
          vertical = { width = 0.2 },
        },
      },
    })
    pcall(telescope.load_extension, "file_browser")
    pcall(telescope.load_extension, "project")
  end,
}
