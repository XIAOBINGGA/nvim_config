return {
  {
    "tpope/vim-markdown",
    event = "FileType",
    ft = { "markdown" },
    config = function()
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
    event = "FileType",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {},
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "npm install",
    event = "FileType",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "dhruvasagar/vim-table-mode",
    event = "FileType",
    ft = { "markdown" },
    config = function()
      vim.cmd(
        [[
        augroup markdown_config
          autocmd!
          autocmd FileType markdown nnoremap <buffer> <M-s> :TableModeRealign<CR>
        augroup END
      ]],
        false
      )
      vim.g.table_mode_sort_map = "<leader>mts"
    end,
  }, --> table mode
  {
    "bullets-vim/bullets.vim",
    event = "FileType",
    ft = { "markdown" },
    config = function()
      vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }
    end,
  }, --> list style
  {
    "tenxsoydev/vim-markdown-checkswitch",
    event = "FileType",
    ft = { "markdown" },
    config = function()
      vim.g.md_checkswitch_style = "cycle"
    end,
  }, --> checkbox shortcut
}
