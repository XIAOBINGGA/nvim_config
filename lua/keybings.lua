-- leader key 为空
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

local opt = {
    noremap = true,
    silent = true
}
-- 本地变量
local map = vim.api.nvim_set_keymap

map("i", "jj", "<Esc>", opt)
-- ; : 互换
map("n", ";", ":", opt)
map("n", ":", ";", opt)

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)
