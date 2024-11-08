-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local map = vim.keymap.set

local opt = {
  noremap = true,
  silent = true,
}

-- ; : 互换
map("n", ";", ":", opt)
map("n", ":", ";", opt)
