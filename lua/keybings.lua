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
------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
-- map("n", "s", "", opt)
map("n", "<leader>sv", ":vsp<CR>", opt)
map("n", "<leader>sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "<leader>sc", "<C-w>c", opt)
-- 关闭其他
map("n", "<leader>so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)

-- lspsage term
-- map("n", "<A-d>", '<cmd>Lspsaga term_toggle<CR>', opt)

local PlugsKey = {}
-- lsp
PlugsKey.mapLsp = function(mapbuf)
  -- format
  mapbuf("n", "<leader>ff", "<cmd>Format<CR>", opt)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- code_actions
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- go xx
  mapbuf("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", opt)
  -- gh
  mapbuf("n", "<leader>gh", "<cmd>Lspsaga hover_doc<CR>", opt)
  -- gr
  mapbuf("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", opt)
  -- diagnostic
  mapbuf("n", "<leader>gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
end
-- nvim-tree
map("n", "<A-m>", ":Neotree<CR>", opt)
map("n", "<leader>m", ":Neotree<CR>", opt)
return PlugsKey
