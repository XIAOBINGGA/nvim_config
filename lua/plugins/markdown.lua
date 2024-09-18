return {
  {
    "tpope/vim-markdown",
    event = "VeryLazy",
    config = function()
      -- tpope/vim-markdown
      vim.g.markdown_syntax_conceal = 0
      vim.g.markdown_fenced_languages = {
        "html",
        "python",
        "bash=sh",
        "json",
        "java",
        "js=javascript",
        "sql",
        "yaml",
        "xml",
        "Dockerfile",
        "Rust",
        "swift",
        "javascript",
        "lua",
      }
    end,
  },
  {
    "yelog/marklive.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    lazy = true,
    ft = "markdown",
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
