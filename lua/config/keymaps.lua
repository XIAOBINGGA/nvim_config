-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true,
}
-- 本地变量
local map = vim.api.nvim_set_keymap

-- 粘贴系统剪切板里的内容
map("n", "<leader>vp", '"+P', opt)
map("v", "<leader>vy", '"+y', opt)
map("i", "jj", "<Esc>", opt)

-- ; : 互换
map("n", ";", ":", opt)
map("n", ":", ";", opt)
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
-- neo-tree
map("n", "<A-m>l", ":Neotree left<CR>", opt)
map("n", "<leader>mf", ":Neotree float<CR>", opt)
map("n", "<leader>mb", ":Neotree bottom<CR>", opt)
map("n", "<leader>mr", ":Neotree right<CR>", opt)
