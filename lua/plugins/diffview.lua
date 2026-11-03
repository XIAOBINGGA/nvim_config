return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewFileHistory", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview: 未提交改动" },
      { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: 当前文件历史" },
      { "<leader>gf", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: 仓库历史" },
    },
    opts = {
      view = {
        merge_tool = {
          layout = "diff3_mixed",
        },
      },
    },
  },
}
