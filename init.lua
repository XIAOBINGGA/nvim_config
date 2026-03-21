require('basic')
-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


if not vim.g.vscode then
   -- ===================== 基础渲染（交给 VS Code 处理） =====================
  vim.opt.number = false          -- 关闭 Neovim 行号（VS Code 自带）
  vim.opt.relativenumber = false  -- 关闭相对行号
  vim.opt.signcolumn = "no"       -- 关闭符号列（VS Code 有自己的诊断提示）
  vim.opt.colorcolumn = ""        -- 关闭颜色列（VS Code 可配置 rulers）
  vim.opt.cursorline = false      -- 关闭光标行高亮（VS Code 自带）
  vim.opt.cursorcolumn = false    -- 关闭光标列高亮
  vim.opt.winblend = 0            -- 关闭窗口透明度（VS Code 控制）
  vim.opt.pumblend = 0            -- 关闭补全菜单透明度

  -- ===================== 文本处理（避免双重处理） =====================
  vim.opt.expandtab = false       -- 关闭自动转空格（VS Code 配置 tab 行为）
  vim.opt.autoindent = false      -- 关闭自动缩进（VS Code 有更智能的缩进）
  vim.opt.smartindent = false     -- 关闭智能缩进
  vim.opt.wrap = false            -- 关闭换行（VS Code 控制代码换行）
  vim.opt.linebreak = false       -- 关闭按单词换行
  vim.opt.list = false            -- 关闭不可见字符显示（VS Code 配置）

  -- ===================== 搜索/高亮（交给 VS Code） =====================
  vim.opt.hlsearch = false        -- 关闭搜索结果高亮（VS Code 自带）
  vim.opt.incsearch = false       -- 关闭实时搜索预览
  vim.opt.ignorecase = false      -- 关闭忽略大小写（VS Code 搜索配置）
  vim.opt.smartcase = false       -- 关闭智能大小写

  -- ===================== 插件/功能禁用（避免冗余） =====================
  vim.g.loaded_netrw = 1          -- 关闭 neovim 内置文件管理器
  vim.g.loaded_netrwPlugin = 1    -- 关闭 netrw 插件
  vim.g.loaded_matchparen = 1     -- 关闭括号匹配高亮（VS Code 自带）
  vim.g.loaded_2html_plugin = 1   -- 关闭 html 导出插件
  vim.g.loaded_getscript = 1      -- 关闭 getscript 插件
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_gzip = 1           -- 关闭 gzip 插件
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_tar = 1            -- 关闭 tar 插件
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_vimball = 1        -- 关闭 vimball 插件
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_zip = 1            -- 关闭 zip 插件
  vim.g.loaded_zipPlugin = 1

  -- ===================== 事件/更新（减少资源消耗） =====================
  vim.opt.updatetime = 1000       -- 降低更新频率（VS Code 无需高频更新）
  vim.cmd("autocmd!")             -- 清空所有自动命令（避免和 VS Code 冲突）
  vim.g.do_filetype_lua = 0       -- 关闭 lua 版 filetype 检测
  vim.g.did_load_filetypes = 1    -- 跳过 filetype 加载
  return {}
end

-- Add some vscode specific keymaps
    -- VSCode-specific keymaps for search and navigation

    -- Keep undo/redo lists in sync with VsCode

    -- Navigate VSCode tabs like lazyvim buffers
    -- vim.keymap.set("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    -- vim.keymap.set("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
    -- 打开上次关闭的页签（Reopen Closed Editor）
vim.keymap.set("n", "<leader>t", [[<cmd>lua require('vscode').action('workbench.action.reopenClosedEditor')<cr>]])

-- 关闭其他所有页签（Close Other Editors）
vim.keymap.set("n", "<leader>o", [[<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<cr>]])


    -- 基础导航/搜索（你已有部分，补充更全）
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])
    -- 跳转到定义（编程核心操作）
    vim.keymap.set("n", "<leader>gd", [[<cmd>lua require('vscode').action('editor.action.goToDeclaration')<cr>]])
    -- 查看定义预览（不跳转文件）
    vim.keymap.set("n", "<leader>gp", [[<cmd>lua require('vscode').action('editor.action.peekDefinition')<cr>]])
    -- 查找引用
    vim.keymap.set("n", "<leader>gr", [[<cmd>lua require('vscode').action('editor.action.findReferences')<cr>]])
    -- 全局替换（搭配查找更实用）
    vim.keymap.set("n", "<leader>r", [[<cmd>lua require('vscode').action('workbench.action.replaceInFiles')<cr>]])

    -- 窗口/面板操作
    vim.keymap.set("n", "<leader>b", [[<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<cr>]])
    vim.keymap.set("n", "<leader>e", [[<cmd>lua require('vscode').action('workbench.view.explorer')<cr>]])
    -- 切换到问题面板（查看代码报错/警告）
    -- vim.keymap.set("n", "<leader>q", [[<cmd>lua require('vscode').action('workbench.action.problems.focus')<cr>]])
    -- 分屏（垂直/水平）
    vim.keymap.set("n", "<leader>sv", [[<cmd>lua require('vscode').action('workbench.action.splitEditor')<cr>]])
    vim.keymap.set("n", "<leader>sh", [[<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<cr>]])
    -- 关闭当前编辑器
    vim.keymap.set("n", "<leader>q", [[<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<cr>]])
    -- 切换编辑器标签页（左右）
    vim.keymap.set("n", "<leader>l", [[<cmd>lua require('vscode').action('workbench.action.nextEditor')<cr>]])
    vim.keymap.set("n", "<leader>h", [[<cmd>lua require('vscode').action('workbench.action.previousEditor')<cr>]])

    -- 编辑操作
    -- 格式化文档
    vim.keymap.set("n", "<leader>f", [[<cmd>lua require('vscode').action('editor.action.formatDocument')<cr>]])
    -- 撤销/重做
    vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")
    -- 重命名变量/函数（重构核心）
    vim.keymap.set("n", "<leader>rn", [[<cmd>lua require('vscode').action('editor.action.rename')<cr>]])
    -- 保存当前文件
    vim.keymap.set("n", "<leader>w", [[<cmd>lua require('vscode').action('workbench.action.files.save')<cr>]])
    -- 保存所有文件
    vim.keymap.set("n", "<leader>W", [[<cmd>lua require('vscode').action('workbench.action.files.saveAll')<cr>]])

    -- 终端/模式
    vim.keymap.set("n", "<leader>z", [[<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<cr>]])
    vim.keymap.set("n", "<leader>t", [[<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<cr>]])
    -- 切换终端（多终端时）
    vim.keymap.set("n", "<leader>tn", [[<cmd>lua require('vscode').action('workbench.action.terminal.focusNext')<cr>]])
    vim.keymap.set("n", "<leader>tp", [[<cmd>lua require('vscode').action('workbench.action.terminal.focusPrevious')<cr>]])

    -- Git 操作（VS Code 内置 Git）
    -- 打开 Git 面板
    vim.keymap.set("n", "<leader>g", [[<cmd>lua require('vscode').action('workbench.view.scm')<cr>]])
    -- Git 提交
    vim.keymap.set("n", "<leader>gc", [[<cmd>lua require('vscode').action('git.commit')<cr>]])
    -- Git 拉取
    vim.keymap.set("n", "<leader>gl", [[<cmd>lua require('vscode').action('git.pull')<cr>]])
    -- Git 推送
    vim.keymap.set("n", "<leader>gp", [[<cmd>lua require('vscode').action('git.push')<cr>]])
    -- 解决 Git 冲突
    vim.keymap.set("n", "<leader>gm", [[<cmd>lua require('vscode').action('git.mergeConflicts.openNextConflict')<cr>]])

    -- 调试操作（开发核心）
    -- 启动/停止调试
    vim.keymap.set("n", "<leader>dd", [[<cmd>lua require('vscode').action('workbench.action.debug.start')<cr>]])
    vim.keymap.set("n", "<leader>dc", [[<cmd>lua require('vscode').action('workbench.action.debug.stop')<cr>]])
    -- 断点操作（切换/清除所有）
    vim.keymap.set("n", "<leader>db", [[<cmd>lua require('vscode').action('editor.action.toggleBreakpoint')<cr>]])
    vim.keymap.set("n", "<leader>dC", [[<cmd>lua require('vscode').action('workbench.action.debug.removeAllBreakpoints')<cr>]])
    -- 调试步进（下一步/步入/步出）
    vim.keymap.set("n", "<leader>dn", [[<cmd>lua require('vscode').action('workbench.action.debug.stepOver')<cr>]])
    vim.keymap.set("n", "<leader>di", [[<cmd>lua require('vscode').action('workbench.action.debug.stepInto')<cr>]])
    vim.keymap.set("n", "<leader>do", [[<cmd>lua require('vscode').action('workbench.action.debug.stepOut')<cr>]])
    