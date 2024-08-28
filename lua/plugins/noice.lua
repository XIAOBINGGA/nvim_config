return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    presets = {
      bottom_search = false,
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
    },
    stages = "slide",
    render = "compact",
    timeout = 2000,
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
   },
}
