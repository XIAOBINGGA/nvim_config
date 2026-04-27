local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboar

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
opt.timeoutlen = 1000

opt.compatible = false       -- 关闭 vi 兼容模式
opt.exrc = false             -- 禁止加载本地 .nvimrc（避免和 VSCode 冲突）
opt.secure = true            -- 安全模式（配合 exrc=false）
opt.number = false           -- 关闭行号（VSCode 自身显示行号，避免重复）
opt.relativenumber = false   -- 关闭相对行号
opt.signcolumn = "no"        -- 关闭符号列（VSCode 自身处理断点/提示）
opt.cursorline = false       -- 关闭光标行高亮（VSCode 自身高亮）
opt.mouse = ""               -- 禁用 Neovim 鼠标支持（交给 VSCode 处理）

vim.opt.expandtab = false    -- 关闭 tab 自动转空格（可选，如需保留可设为 true）
vim.opt.autoindent = false   -- 关闭自动缩进（核心）
vim.opt.smartindent = false  -- 关闭智能缩进（核心）
vim.opt.cindent = false      -- 关闭 C 风格缩进（额外补充，防止智能缩进残留）
vim.opt.indentexpr = ""      -- 清空缩进表达式（彻底禁用自动缩进逻辑）
vim.opt.formatlistpat = ""         -- 关闭列表格式化
vim.opt.formatoptions = ""         -- 彻底禁用 Neovim 自动格式化
vim.opt.hlsearch = false    -- 关闭搜索结果高亮（核心）
-- vim.opt.incsearch = false   -- 关闭实时增量搜索（可选，如需保留实时搜索可设为 true）