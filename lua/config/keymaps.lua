local map = vim.keymap.set
local va = function(action, desc, mode)
  mode = mode or "n"
  map(mode, desc and desc[1], string.format([[<cmd>lua require('vscode').action('%s')<cr>]], action), { desc = desc and desc[2] })
end

-- ── 面板 / 视图 ──────────────────────────────────
va("workbench.action.toggleSidebarVisibility", { "<leader>b", "侧边栏" })
va("workbench.view.explorer", { "<leader>e", "文件浏览器" })
va("workbench.action.togglePanel", { "<leader>j", "底部面板" })
va("workbench.action.terminal.toggleTerminal", { "<leader>t", "终端" })
va("workbench.action.toggleZenMode", { "<leader>z", "禅模式" })
va("workbench.action.toggleMaximizedPanel", { "<leader>J", "最大化面板" })

-- ── 快速搜索 ────────────────────────────────────
va("workbench.action.quickOpen", { "<leader>ff", "快速打开文件" })
va("workbench.action.findInFiles", { "<leader>fg", "全局搜索" })
va("actions.find", { "<leader>fs", "文件内搜索" })
va("editor.action.startFindReplaceAction", { "<leader>fh", "文件内替换" })
va("workbench.action.gotoSymbol", { "<leader>fb", "文件符号跳转" })
va("workbench.action.showAllSymbols", { "<leader>fB", "全局符号跳转" })
va("workbench.action.gotoLine", { "<leader>fl", "跳转到行" })
va("workbench.action.showCommands", { "<leader>fp", "命令面板" })
va("workbench.action.openRecent", { "<leader>fr", "最近文件" })

-- ── 编辑器 / 标签页 ─────────────────────────────
va("workbench.action.nextEditor", { "<leader>n", "下一个标签" })
va("workbench.action.previousEditor", { "<leader>p", "上一个标签" })
va("workbench.action.closeActiveEditor", { "<leader>c", "关闭标签" })
va("workbench.action.splitEditor", { "<leader>sv", "垂直拆分" })
va("workbench.action.splitEditorOrthogonal", { "<leader>sh", "水平拆分" })
va("workbench.action.moveEditorToNextGroup", { "<leader>mn", "移编辑器到下一组" })
va("workbench.action.moveEditorToPreviousGroup", { "<leader>mp", "移编辑器到上一组" })
va("workbench.action.focusLeftGroup", { "<leader>hl", "焦点→左组" })
va("workbench.action.focusRightGroup", { "<leader>hr", "焦点→右组" })
va("workbench.action.focusAboveGroup", { "<leader>hk", "焦点→上组" })
va("workbench.action.focusBelowGroup", { "<leader>hj", "焦点→下组" })
va("workbench.action.closeOtherEditors", { "<leader>co", "关闭其他标签" })
va("workbench.action.closeEditorsInGroup", { "<leader>cg", "关闭组内标签" })
va("workbench.action.reopenClosedEditor", { "<leader>ur", "恢复关闭的标签" })
va("workbench.action.showAllEditors", { "<leader>bl", "缓冲区列表" })

-- ── 导航 ────────────────────────────────────────
va("workbench.action.navigateBack", { "<leader>ob", "后退" })
va("workbench.action.navigateForward", { "<leader>of", "前进" })

-- ── 代码操作 (LSP 由 VSCode 提供) ──────────────
va("editor.action.revealDefinition", { "gd", "转到定义" })
va("editor.action.peekDefinition", { "gp", "预览定义" })
va("editor.action.referenceSearch.trigger", { "gr", "查找引用" })
va("editor.action.rename", { "gR", "重命名" })
va("editor.action.quickFix", { "gq", "快速修复" })
va("editor.action.formatDocument", { "<leader>gF", "格式化文档" })
va("editor.action.formatSelection", { "<leader>gf", "格式化选区" })

-- ── 编辑器操作 ──────────────────────────────────
va("editor.action.moveLinesUpAction", { "<A-k>", "上移行" })
va("editor.action.moveLinesDownAction", { "<A-j>", "下移行" })
va("editor.action.copyLinesUpAction", { "<A-S-k>", "上复制行" })
va("editor.action.copyLinesDownAction", { "<A-S-j>", "下复制行" })
va("editor.action.joinLines", { "J", "合并行" })
va("editor.action.indentLines", { ">", "缩进" }, "v")
va("editor.action.outdentLines", { "<", "反缩进" }, "v")
va("editor.action.selectHighlights", { "<leader>sl", "选中所有相同词" })
va("editor.action.addSelectionToNextFindMatch", { "<leader>sn", "添加下一个匹配" })
va("editor.action.transformToUppercase", { "<leader>uU", "转大写" }, "v")
va("editor.action.transformToLowercase", { "<leader>uu", "转小写" }, "v")
va("editor.action.toggleTabFocusMode", { "<leader>wm", "切换 Tab 焦点模式" })

-- ── Git (VSCode 内置) ────────────────────────────
va("workbench.view.scm", { "<leader>gg", "源代码管理" })
va("git.stage", { "<leader>gs", "暂存更改" })
va("git.unstage", { "<leader>gu", "取消暂存" })

-- ── 其他视图 ────────────────────────────────────
va("workbench.actions.view.problems", { "<leader>xx", "问题面板" })
va("workbench.view.extensions", { "<leader>xe", "扩展" })
va("workbench.view.debug", { "<leader>xd", "调试" })

-- ── 清除搜索高亮 ────────────────────────────────
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "清除高亮" })
