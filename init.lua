-- 基础配置
require('basic')
-- 添加包管理器
require('plugs')
-- 添加主题
require('colorscheme')
-- -- bufferline
-- require('plugs_config.buffer-line')
-- lualine
require('plugs_config.lua-line')
-- telescope
require('plugs_config.telescope')
-- 添加project项目管理
require('plugs_config.project')
-- 插件配置
require('plugs_config.nvim-tree')
-- treeitter
require('plugs_config.nvim-treesitter')

-- lsp 配置
require('lsp.setup')
-- 补全引擎
require('lsp.cmp')
--- null-ls 
require('lsp.null-ls')
-- 注释插件
require('plugs_config.comment')
-- 快速移动插件
require('plugs_config.leap')
-- surround 插件
require('plugs_config.surround')
-- 括号自动补全插件
require('plugs_config.autopairs')
print("init ok")
