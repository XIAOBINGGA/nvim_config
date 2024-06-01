return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-project.nvim',
  },
  config = function()
    local status_telescope, telescope = pcall(require, "telescope")
    if not status_telescope then
      vim.notify("没有找到 telescope")
      return
    end
    telescope.setup({
      extensions = {
        file_browser = {
          -- theme = "ivy",
          hijack_netrw = true,
        },
        project = {
          base_dirs = {
            '~/src',
          },
          hidden_files = true, -- default: false
          theme = "dropdown",
          order_by = "recent",
          search_by = {"path", "title"},
          sync_with_nvim_tree = false, -- default false 
        },
      },
      defaults = {
        -- mappings = require('keybings').telescopeList
      }
    })
    pcall(telescope.load_extension, 'file_browser')
    pcall(telescope.load_extension, "project")
  end
}
