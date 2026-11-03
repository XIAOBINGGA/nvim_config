# 组件说明:作用 · 快捷键 · 配置示例

本配置(LazyVim starter)中核心开发组件的用法速查。所有快捷键为 LazyVim 默认,`<leader>` 即空格。用 `:WhichKey` 或按 `<leader>` 等待弹窗可随时查看。

---

## 1. LSP — 语言服务(nvim-lspconfig + mason)

**作用**:跳转定义、查找引用、重命名、代码诊断、悬浮文档。
**装 LSP**:`:Mason` 里搜索安装,或在配置的 `ensure_installed` 里声明(本配置见 `lua/plugins/frontend.lua`)。

### 快捷键

| 快捷键 | 功能 |
|---|---|
| `gd` | 跳转到定义 |
| `gD` | 跳转到声明 |
| `gr` | 查找引用 |
| `gI` | 跳转到实现 |
| `gy` | 跳转到类型定义 |
| `K` | 悬浮文档 |
| `<leader>cr` | 重命名符号 |
| `<leader>ca` | Code Action(快速修复/导入) |
| `<leader>cf` | 格式化 |
| `]e` / `[e` | 下一个/上一个错误 |
| `<leader>cd` | 行内诊断信息 |

### 配置示例(lua/plugins/xxx.lua)

```lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {},          -- 最简:空表启用默认配置
      html = {},
      -- 自定义 settings(选项按各服务器文档):
      -- cssls = { settings = { css = { validate = true } } },
      -- mason registry 没有的服务器,关掉自动安装:
      -- rescriptls = { mason = false },
    },
  },
}
```

---

## 2. 补全 — blink.cmp

**作用**:输入时自动弹出补全(LSP + snippets + buffer 文字),纯 Lua fuzzy 匹配。

| 快捷键 | 功能 |
|---|---|
| `<C-n>` / `<C-p>` | 下一个/上一个候选 |
| `<CR>` | 确认选中项 |
| `<C-space>` | 手动触发补全 |
| `<C-e>` | 关闭补全窗 |
| `<C-y>`(emmet 等) | 展开/接受 |

配置见 `lua/plugins/blink.lua`(本配置已自定义,纯 Lua fuzzy 引擎)。

---

## 3. 格式化 — conform.nvim

**作用**:保存时按 formatter 自动格式化当前文件。formatter 是外部程序,需已安装且在 PATH(mason 或 brew/npm 装)。

| 快捷键 | 功能 |
|---|---|
| `<leader>cf` | 手动格式化 |
| 保存 | 自动格式化(LazyVim 默认开启 `format_on_save`) |

### 配置示例

```lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      lua = { "stylua" },
      -- 保存时只跑第一个可用的 formatter:
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
```

---

## 4. Lint — nvim-lint

**作用**:保存时运行 linter,以诊断形式显示风格/规范问题(与 LSP 诊断合并)。linter 未装则静默跳过。

| 快捷键 | 功能 |
|---|---|
| `:Lint` | 手动触发一次 |
| `<leader>xx` | 诊断列表(trouble) |
| `<leader>xX` | 当前文件诊断列表 |

### 配置示例

```lua
return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}
    opts.linters_by_ft.markdown = { "markdownlint-cli2" }
    opts.linters_by_ft.sh = { "shellcheck" }
  end,
}
```

---

## 5. 模糊搜索 — fzf-lua

**作用**:全项目文件/内容/符号模糊搜索。依赖外部 `fd` 和 `rg`。
> 注意:本配置用的是 fzf-lua 而非 telescope。

| 快捷键 | 功能 |
|---|---|
| `<leader><space>` | 模糊查找文件 |
| `<leader>/` | 全局内容 grep(rg) |
| `<leader>sg` | 同上,内容搜索 |
| `<leader>sG` | 内容搜索(当前光标词) |
| `<leader>ff` | 查找文件 |
| `<leader>fr` | 最近打开的文件 |
| `<leader>ss` | 文档内符号 |
| `<leader>sS` | 全项目符号(LSP) |
| `<leader>sw` | 搜索光标下单词 |
| `<leader>sR` | 搜索寄存器 |
| `<leader>sk` | 搜索快捷键 |
| `<C-q>`(在结果里) | 全部送入 quickfix |

### 配置示例

```lua
return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    opts.winopts = opts.winopts or {}
    opts.winopts.height = 0.85   -- 弹窗更高
  end,
}
```

---

## 6. Git — gitsigns.nvim + lazygit

**作用**:gitsigns 在行号旁显示增/删/改标记、行内 diff 预览;lazygit 是完整 Git TUI(依赖外部 `lazygit`)。

### gitsigns

| 快捷键 | 功能 |
|---|---|
| `]h` / `[h` | 下一个/上一个 hunk |
| `<leader>gp` | 预览本行改动 |
| `<leader>gb` | blame(谁改的) |
| `<leader>gf` | 当前文件改动列表 |
| `<leader>hs` | 暂存(stage)本 hunk |
| `<leader>hr` | 还原本 hunk |

### lazygit

| 快捷键 | 功能 |
|---|---|
| `<leader>gg` | 打开 lazygit(当前项目根) |
| `<leader>gG` | 打开 lazygit(当前文件所在目录) |

---

## 7. 批量替换 — grug-far.nvim

**作用**:全项目正则查找替换,边输入边预览,逐条或全部应用。

| 快捷键 | 功能 |
|---|---|
| `<leader>sr` | 打开批量替换面板 |
| `<leader>sR` | 替换当前光标词 |

---

## 8. 会话管理 — persistence.nvim

**作用**:按工作目录自动保存会话(打开的文件、窗口布局),退出再进入同一目录可恢复。**本配置没有专门的项目切换器,切换项目 = cd 到目录后恢复其会话**。

| 快捷键 | 功能 |
|---|---|
| `<leader>qs` | 恢复当前目录的上次会话 |
| `<leader>qS` | 选择要恢复的会话 |
| `<leader>ql` | 恢复最后一次会话 |
| `<leader>qd` | 不保存退出当前会话 |

---

## 9. 语法树 — nvim-treesitter(+ textobjects)

**作用**:基于语法树的精准高亮、缩进、文本对象(按函数/类/参数操作)。

| 快捷键 | 功能 |
|---|---|
| `vaf` / `vif` | 选中整个/内部函数 |
| `vab` / `vib` | 选中整个/内部代码块 |
| `]f` / `[f` | 跳到下一个/上一个函数开头 |
| `]c` / `[c` | 下一个/上一个类 |
| `:TSUpdate` | 更新 parser |

### 配置示例(追加 parser)

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed or {}, { "html", "css", "scss", "tsx" })
  end,
}
```

> ReScript parser 需手动安装,见 FEATURES.md「ReScript 环境搭建」。

---

## 10. 诊断列表 — trouble.nvim

| 快捷键 | 功能 |
|---|---|
| `<leader>xx` | 全项目诊断列表 |
| `<leader>xX` | 当前 buffer 诊断 |
| `<leader>xs` | LSP 符号列表 |
| `<leader>xL` | Location list |
| `{count}` + 跳转键 | 列表内跳转 |

---

## 11. 注释 — ts-comments.nvim

| 快捷键 | 功能 |
|---|---|
| `gcc` | 行注释/取消(可带数字,`3gcc` 注释 3 行) |
| `gc` + 动作 | 块注释,如 `gcap` 注释整个段落 |

---

## 12. 跳转 — flash.nvim

**作用**:屏幕内闪电跳转,替代 easymotion/hop。

| 快捷键 | 功能 |
|---|---|
| `s` | 触发:输入字母标出所有匹配位置,按键即跳 |
| `S` | Treesitter 节点选择跳转 |
| `r`(普通模式) | 远程跳转:跳过去操作再跳回来 |

---

## 13. 编辑增强 — mini.pairs / mini.ai / mini.surround

| 快捷键 | 功能 |
|---|---|
| 自动 | `(` `[` `"` 等自动配对,删除时成对删(mini.pairs) |
| `sa` / `sd` / `sr` | 添加/删除/替换环绕符,如 `sa"` 加引号、`sd"` 去引号、`sr")` 引号换括号(mini.surround) |
| `vib` / `vab` 等 | 增强文本对象:参数 `aa/ia`、标签 `at`、数字 `in` 等(mini.ai) |

---

## 14. TODO 标记 — todo-comments.nvim

**作用**:高亮并搜索 `TODO:` `FIXME:` `HACK:` `NOTE:` 等注释标记。

| 快捷键 | 功能 |
|---|---|
| `<leader>st` | 搜索全部 TODO |
| `<leader>sT` | 搜索 TODO(仅当前文件) |
| `]t` / `[t` | 下一个/上一个 TODO |

---

## 15. UI 与辅助

| 组件 | 作用 | 相关按键 |
|---|---|---|
| which-key.nvim | 按键提示弹窗 | 按 `<leader>` 停一下即出;`<leader>?` 查 buffer 内快捷键 |
| noice.nvim | 重绘消息/命令行/搜索为浮动窗 | `:Noice` 历史 |
| neo-tree.nvim | 文件树 | `<leader>e` 开关;`<leader>ge` 悬浮;`<leader>fe` 当前文件位置 |
| bufferline.nvim | 顶部标签栏 | `H` / `L` 切换 buffer;`<leader>bd` 关闭 |
| snacks.nvim | 终端、通知、缩进线等合集 | `<leader>fT` 悬浮终端;`<c-/>` 底部终端 |
| lualine.nvim | 底部状态栏(含 Flutter 设备/版本,见 flutter.lua) | — |
| markdown-preview.nvim | 浏览器预览 Markdown | `<leader>cp` 开/关预览(lang.markdown extra) |

---

## 16. 文件树 — neo-tree.nvim

**作用**:文件树(本配置为居中浮动窗口)。`<leader>e` 开关,支持新建/重命名/移动文件、git 状态标记。

| 快捷键(文件树内) | 功能 |
|---|---|
| `<leader>e` | 开关文件树 |
| `y` | 复制文件名到系统剪贴板 |
| `Y` | 复制完整绝对路径 |
| `c` / `x` / `p` | 复制 / 剪切 / 粘贴(树内文件操作) |
| `a` | 新建文件/目录(以 `/` 结尾则为目录) |
| `r` | 重命名 |
| `d` | 删除 |
| `m` 或空格 | 多选标记,配合 `y`/`x` 批量操作 |
| `H` | 递归折叠/展开目录 |
| `q` | 关闭文件树 |

---

## 17. 实用小技巧

### 复制当前文件名/路径(Normal 模式命令)

```vim
:let @+=expand('%:t')   " 只复制文件名,如 foo.lua
:let @+=expand('%')     " 复制相对路径,如 lua/plugins/foo.lua
:let @+=expand('%:p')   " 复制绝对路径
```

`@+` 是系统剪贴板寄存器,复制后可直接粘贴到别处。`expand()` 常用修饰符:

| 修饰符 | 含义 |
|---|---|
| `%:t` | 文件名(tail) |
| `%:p` | 绝对路径 |
| `%:.` | 相对当前工作目录的路径 |
| `%:h` | 所在目录名 |
| `%:e` | 扩展名 |
| `%:t:r` | 文件名去掉扩展名 |

### 其他高频操作

| 按键 | 功能 |
|---|---|
| `<C-s>` | 保存文件 |
| `H` / `L` | 上一个/下一个 buffer(标签页) |
| `<leader>bd` | 关闭当前 buffer |
| `gcc` | 注释/取消注释当前行 |
| `gc` + 动作 | 注释文本对象/选区(Visual 模式 `gc`) |
| `s` | flash 快速跳转(输入字母即跳) |
| `<leader>ss` | 当前文件符号列表(大纲跳转) |
| `<leader>sr` | 全项目批量查找替换 |
| `<leader>xx` | 诊断列表(trouble) |

---

## 附录:外部程序依赖

以上组件运行依赖的外部程序(`rg`、`fd`、`lazygit`、`node`、formatter/linter 等)及安装方法,见 **EXTERNAL_DEPS.md**;Mason 与 LSP 三层架构的原理详解见 **FEATURES.md**。
