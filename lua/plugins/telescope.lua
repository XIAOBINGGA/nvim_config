return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
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
    -- {
    --   "<leader>tp",
    --   mode = { "n" },
    --   function()
    --     require("telescope.builtin").project()
    --   end,
    --   desc = "project",
    -- },
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
    -- telescope.setup({
    --   extensions = {
    --     file_browser = {
    --       -- theme = "ivy",
    --       hijack_netrw = true,
    --     },
    --     project = {
    --       base_dirs = {
    --         '~/src',
    --       },
    --       hidden_files = true, -- default: false
    --       theme = "dropdown",
    --       order_by = "recent",
    --       search_by = {"path", "title"},
    --       sync_with_nvim_tree = false, -- default false
    --     },
    --   },
    --   defaults = {
    --     -- mappings = require('keybings').telescopeList
    --   }
    -- })
    pcall(telescope.load_extension, 'file_browser')
    pcall(telescope.load_extension, "project")
  end,
}
