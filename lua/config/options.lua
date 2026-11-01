-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- 关闭保存时自动格式化（所有项目），改为手动 <leader>lf 格式化
vim.g.autoformat = false
-- vim.o.guifont = "0xProto Nerd Font:h14" -- text below applies for VimScript

local opt = vim.opt

opt.spell = false
-- opt.conceallevel = 0
-- opt.wrap = true
-- opt.relativenumber = false
-- opt.guifont = { "0xProto Nerd Font", "Source Han Sans SC", ":h12" }
-- opt.guifont = {"CaskaydiaCove Nerd Font", "Source Han Sans CN", "微软雅黑", "Maple Mono SC NF", ":h12" }
-- opt.guicursor =
-- "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkoff0-blinkon0-Cursor/lCursor,sm:block-blinkwait0-blinkoff0-blinkon0"
-- opt.list = true
-- opt.listchars = { space = "·" }
-- opt.modelines = 0
-- opt.showcmd = false
-- opt.scrolloff = 0
-- opt.cinkeys = "0{,0},0),0],0#,!^F,o,O,e"
-- opt.indentkeys = "0{,0},0),0],0#,!^F,o,O,e"

-- 基本编辑体验
opt.number = true -- 绝对行号(LazyVim 默认已开,显式声明)
opt.tabstop = 2 -- Tab 宽度 2 空格
opt.shiftwidth = 2 -- 缩进宽度 2 空格
opt.softtabstop = 2
opt.expandtab = true -- Tab 转空格
opt.smartindent = true -- 智能缩进
opt.wrap = false -- 不自动换行
opt.scrolloff = 8 -- 光标上下保留 8 行
opt.sidescrolloff = 8

-- 搜索
opt.ignorecase = true -- 搜索忽略大小写
opt.smartcase = true -- 有大写时精确匹配
opt.hlsearch = true -- 高亮搜索结果
opt.incsearch = true -- 边输入边搜索

-- 界面
opt.cursorline = true -- 高亮当前行
opt.signcolumn = "yes" -- 始终显示 sign 列,避免抖动
opt.termguicolors = true -- 真彩色
opt.undofile = true -- 持久化撤销历史
opt.splitbelow = true -- 水平分屏在下方打开
opt.splitright = true -- 垂直分屏在右侧打开
opt.mouse = "a" -- 启用鼠标
opt.clipboard = "unnamedplus" -- 与系统剪贴板共享
