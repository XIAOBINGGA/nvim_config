return {
  "iamcco/markdown-preview.nvim",
  event = "VeryLazy",
  enabled = require("tools").isenable(1),
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}
