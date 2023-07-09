-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

local PlugsKey = {}

-- lsp
PlugsKey.mapLSP = function(mapbuf)
	-- 格式化
	mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opt)
end
-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>ff", ":NvimTreeFindFileToggle<CR>", opt)
return PlugsKey
