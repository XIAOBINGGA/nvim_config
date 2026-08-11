# vscode-neovim 快捷键表

> `<leader>` = `Space`

## 面板 / 视图

| 按键 | 功能 |
|------|------|
| `<leader>b` | 切换侧边栏 |
| `<leader>e` | 文件浏览器 |
| `<leader>j` | 底部面板 |
| `<leader>J` | 最大化面板 |
| `<leader>t` | 终端 |
| `<leader>z` | 禅模式 |

## 快速搜索

| 按键 | 功能 |
|------|------|
| `<leader>ff` | 快速打开文件 |
| `<leader>fg` | 全局搜索 |
| `<leader>/` | 全局搜索 (来自 LazyVim extra) |
| `<leader>fs` | 文件内搜索 |
| `<leader>fh` | 文件内替换 |
| `<leader>fb` | 文件符号跳转 |
| `<leader>fB` | 全局符号跳转 |
| `<leader>fl` | 跳转到行 |
| `<leader>fp` | 命令面板 |
| `<leader>fr` | 最近文件 |

## 编辑器 / 标签页

| 按键 | 功能 |
|------|------|
| `<leader>n` | 下一个标签 |
| `<leader>p` | 上一个标签 |
| `S-h` | 上一个编辑器 (LazyVim extra) |
| `S-l` | 下一个编辑器 (LazyVim extra) |
| `<leader>c` | 关闭标签 |
| `<leader>co` | 关闭其他标签 |
| `<leader>cg` | 关闭组内标签 |
| `<leader>ur` | 恢复关闭的标签 |
| `<leader>sv` | 垂直拆分 |
| `<leader>sh` | 水平拆分 |
| `<leader>mn` | 移编辑器到下一组 |
| `<leader>mp` | 移编辑器到上一组 |
| `<leader>hl` | 焦点到左组 |
| `<leader>hr` | 焦点到右组 |
| `<leader>hk` | 焦点到上组 |
| `<leader>hj` | 焦点到下组 |

## 导航

| 按键 | 功能 |
|------|------|
| `<leader>ob` | 后退 |
| `<leader>of` | 前进 |

## 代码操作 (VSCode LSP)

| 按键 | 功能 |
|------|------|
| `gd` | 转到定义 |
| `gp` | 预览定义 |
| `gr` | 查找引用 |
| `gR` | 重命名 |
| `gq` | 快速修复 |
| `<leader>gF` | 格式化文档 |
| `<leader>gf` | 格式化选区 |

## 编辑器操作

| 按键 | 功能 |
|------|------|
| `A-k` | 上移行 |
| `A-j` | 下移行 |
| `A-S-k` | 上复制行 |
| `A-S-j` | 下复制行 |
| `J` | 合并行 |
| `>` (可视) | 缩进 |
| `<` (可视) | 反缩进 |
| `<leader>sl` | 选中所有相同词 |
| `<leader>sn` | 添加下一个匹配 |
| `<leader>uU` (可视) | 转大写 |
| `<leader>uu` (可视) | 转小写 |
| `<Esc>` | 清除搜索高亮 |

## Git

| 按键 | 功能 |
|------|------|
| `<leader>gg` | 源代码管理 |
| `<leader>gs` | 暂存更改 |
| `<leader>gu` | 取消暂存 |

## 其他视图

| 按键 | 功能 |
|------|------|
| `<leader>xx` | 问题面板 |
| `<leader>xe` | 扩展 |
| `<leader>xd` | 调试 |

## 文本编辑增强 (Neovim 插件)

| 按键 | 模式 | 功能 | 插件 |
|------|------|------|------|
| `s` | n/x/o | 快速跳转 (Flash) | flash.nvim |
| `gc` | n/v | 注释文本对象/选区 | mini.comment |
| `gcc` | n | 注释当前行 | mini.comment |
| `ys<motion><char>` | n | 添加环绕 | mini.surround |
| `ds<char>` | n | 删除环绕 | mini.surround |
| `cs<char><char>` | n | 替换环绕 | mini.surround |
| `gS` | n | 拆分/合并 | mini.splitjoin |
| `ga<motion><char>` | n/v | 快速对齐 | vim-easy-align |
| `[q` | n | 上一个 quickfix | vim-unimpaired |
| `]q` | n | 下一个 quickfix | vim-unimpaired |
| `[<Space>` | n | 上方插入空行 | vim-unimpaired |
| `]<Space>` | n | 下方插入空行 | vim-unimpaired |
