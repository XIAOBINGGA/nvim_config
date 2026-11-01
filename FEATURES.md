# Neovim 配置功能说明

> 基于 **LazyVim** 发行版的配置,插件管理器为 **lazy.nvim**。
> 本文档列出当前安装的全部组件及其用途。
> 生成日期:2026-10-31

## 目录结构

```
~/.config/nvim/
├── init.lua              # 入口:引导 lazy.nvim 和 LazyVim
├── lazyvim.json          # LazyVim 配置记录(extras 列表等)
├── lazy-lock.json        # 插件版本锁定文件
├── stylua.toml           # Lua 代码格式化配置
└── lua/
    ├── config/
    │   ├── lazy.lua      # lazy.nvim 初始化(浅克隆、SSH 拉取、超时调优)
    │   ├── options.lua   # 全局选项(当前仅关闭拼写检查)
    │   ├── keymaps.lua   # 自定义快捷键(当前为空)
    │   └── autocmds.lua  # 自动命令(自定义了插入离开/文本变化时自动保存)
    └── plugins/          # 自定义插件目录
        ├── init.lua      # 占位文件
        └── blink.lua     # blink.cmp 改用纯 Lua fuzzy 实现(网络无法下载二进制)
```

## 核心框架

| 组件 | 用途 |
|---|---|
| **lazy.nvim** | 插件管理器。负责插件的下载、更新、懒加载;`{ import = "plugins" }` 会自动加载 `lua/plugins/` 下的所有插件配置 |
| **LazyVim** | Neovim 发行版框架。提供默认选项、快捷键、自动命令和一整套开箱即用的插件组合 |

## 补全系统

| 组件 | 用途 |
|---|---|
| **blink.cmp** | 补全引擎。聚合 LSP、代码片段、缓冲区词语等补全来源,提供模糊匹配、排序和补全菜单。当前配置为纯 Lua fuzzy 实现(见 `lua/plugins/blink.lua`) |
| **friendly-snippets** | 常用语言代码片段库(函数模板、循环模板等),由 blink.cmp 消费 |

## LSP(语言服务)

| 组件 | 用途 |
|---|---|
| **mason.nvim** | LSP 服务器、格式化器、linter 的包管理器。用 `:Mason` 命令图形化安装各语言工具链 |
| **mason-lspconfig.nvim** | mason 与 nvim-lspconfig 之间的桥接,自动把已安装的 LSP 服务器接到编辑器 |
| **nvim-lspconfig** | 各语言 LSP 服务器的官方配置集合(启动参数、root 目录检测等) |
| **lazydev.nvim** | Lua 开发专用增强,为 nvim 配置文件编写提供 LuaLS 类型补全和文档 |

## 语法与代码结构

| 组件 | 用途 |
|---|---|
| **nvim-treesitter** | 语法解析器。提供精准的语法高亮、代码折叠、缩进(`:TSInstall <语言>` 安装解析器) |
| **nvim-treesitter-textobjects** | 基于语法的文本对象,如 `vaf` 选中整个函数、`cif` 修改 if 块 |
| **nvim-ts-autotag** | HTML/JSX 标签自动闭合与重命名(改 `<div>` 时 `</div>` 同步变) |
| **ts-comments.nvim** | 按语法感知的注释(`gcc`),正确处理各种语言注释风格 |

## 查找与搜索

| 组件 | 用途 |
|---|---|
| **fzf-lua** | 模糊查找器(LazyVim v14+ 默认,替代 telescope)。`<leader><space>` 找文件、`<leader>/` 全局搜文本、`<leader>sg` grep 等 |
| **grug-far.nvim** | 全项目批量查找替换(基于正则),`<leader>sr` 打开,边预览边替换 |

## 文件与项目管理

| 组件 | 用途 |
|---|---|
| **neo-tree.nvim** | 文件树侧边栏。`<leader>e` 开关,支持新建/重命名/移动文件、git 状态标记 |
| **bufferline.nvim** | 顶部标签页栏,显示已打开的 buffer、诊断图标 |
| **persistence.nvim** | 会话保存与恢复。退出时记住打开的文件和窗口布局,`<leader>qs` 恢复上次会话 |

## 编辑增强

| 组件 | 用途 |
|---|---|
| **mini.pairs** | 自动配对括号、引号:输入 `(` 自动补 `)`,支持删除时成对删 |
| **mini.ai** | 增强文本对象:更智能的 `a"` / `i(`,额外支持函数参数 `aa`/`ia` 等 |
| **flash.nvim** | 快速跳转。`s` 触发,输入字母在屏幕上标记所有位置,按键即跳(替代 easymotion) |
| **todo-comments.nvim** | 高亮和查找 `TODO` / `FIXME` / `HACK` 等注释标记,`<leader>st` 列出所有待办 |

## Git 集成

| 组件 | 用途 |
|---|---|
| **gitsigns.nvim** | 行内 git 标记:左侧显示增/删/改符号,`<leader>gp` 预览改动、`]h` 跳到下个改动 |

## 界面与外观

| 组件 | 用途 |
|---|---|
| **tokyonight.nvim** | 默认配色主题 |
| **catppuccin** | 备选配色主题(LazyVim 内置切换) |
| **lualine.nvim** | 底部状态栏:模式、分支、诊断数量、文件信息 |
| **noice.nvim** | 重做消息与命令行界面:把 `:` 命令、搜索、通知渲染成更现代的浮动窗口 |
| **which-key.nvim** | 按键提示。按下 `<leader>` 后停顿,弹出后续可用快捷键菜单 |
| **snacks.nvim** | LazyVim 的多功能工具箱:通知(notify)、仪表盘(dashboard)、大文件处理、缓冲区滚动动画、缩进参考线等 |
| **trouble.nvim** | 诊断/引用/待办列表面板。`<leader>xx` 打开,集中查看所有报错警告 |

## 基础依赖库(不直接操作,供其他插件使用)

| 组件 | 用途 |
|---|---|
| **plenary.nvim** | Lua 常用函数库(异步、路径、测试框架),众多插件的依赖 |
| **nui.nvim** | UI 组件库(浮动窗口、弹窗),noice 等插件的依赖 |
| **mini.icons** | 文件类型图标(文件树、补全菜单中的小图标) |

## Mason 详解:它是什么、怎么工作

Mason 管理的不是 Neovim 插件,而是 **Neovim 之外的可执行程序**,分四大类:

| 类型 | 例子 | 作用 |
|---|---|---|
| **LSP 服务器** | typescript-language-server、vscode-css-language-server | 跳转、补全、报错、重命名 |
| **格式化器** | prettier、stylua、ruff format | 代码格式化(conform.nvim 调用) |
| **Linter** | eslint、shellcheck | 静态检查(nvim-lint 调用) |
| **DAP 适配器** | debugpy、js-debug | 调试器对接 |

### 工作原理

```
:MasonInstall html-lsp
      ↓
查 registry(mason-org/mason-registry,就是个包定义清单)
      ↓
按条目下载(https 拉包 / 或 npm、pip、go install 编译)
      ↓
装到 ~/.local/share/nvim/mason/packages/xxx/
      ↓
在 .../mason/bin/ 下放符号链接(可执行文件)
      ↓
mason-lspconfig 把这个 bin 路径接进 PATH
      ↓
nvim-lspconfig 启动它 → LSP 生效
```

### 关键认知:Mason 只管"装",不管"配"

职责划分是三件套:

- **mason.nvim** —— 下载安装(快递员)
- **mason-lspconfig** —— 把装好的服务器注册到 LSP(接线员)
- **nvim-lspconfig** —— 定义每个服务器怎么启动、参数是什么(说明书)

### Mason 不是必需品

LSP 客户端只在乎 **PATH 上有没有叫 `xxx-language-server` 的可执行文件**,至于是谁装的完全无所谓。所以可以用系统包管理器自己装:

```sh
npm i -g @vscode/vscode-langservers-extracted   # 提供 html / cssls
npm i -g typescript typescript-language-server  # 提供 ts/js 的 LSP
```

装完 mason 直接不用,LSP 照常工作。

### 弱网环境建议

mason 下载走 GitHub HTTPS 直链,本机网络直连 GitHub 超时,所以:

1. **优先用系统包管理器自己装**:npm 换 npmmirror 镜像秒下,brew 走清华镜像也快
2. 有代理时:启动 nvim 前 `export HTTPS_PROXY=http://127.0.0.1:端口`,mason 的 curl 会自动走代理
3. 可改 mason 的 `github.download_url_template` 套加速镜像前缀(不稳定,碰运气)
4. 下载超时是硬编码 30 秒(仅限建连,传输无限制),不可配置——连不上才是问题,慢不是

## 三件套配置关系详解(LSP 的三层架构)

### 各层职责回顾

```
nvim-lspconfig          mason-lspconfig         mason.nvim
(说明书:怎么启动)  ←  (接线员:把 bin 接进来)  ←  (快递员:下载安装)
        ↓
   vim.lsp(客户端,真正和服务器通信、请求补全/诊断的是它)
```

- **mason.nvim**:只负责把二进制放到 `~/.local/share/nvim/mason/bin/`。装完它对 LSP 一无所知,不做任何"启用"动作
- **mason-lspconfig**:两件事——① mason 装好某个 server 后通知 nvim-lspconfig;② 反过来,你在 nvim-lspconfig 里声明了某个 server 但没装,它可以自动触发 mason 去装(保证已安装集合和已配置集合一致)
- **nvim-lspconfig**:每个 server 的"启动说明书"(命令、参数、root 目录识别规则),最终调 `vim.lsp.config()` + `vim.lsp.enable()` 拉起客户端

数据流:**配置写在 nvim-lspconfig 侧 → mason-lspconfig 保证服务器已装 → mason 提供二进制 → 按说明书启动**

### LazyVim 怎么把三者包起来

LazyVim 在 `LazyVim/lua/lazyvim/plugins/lsp/init.lua` 里给 `nvim-lspconfig` 定义了一个大的 `opts`,核心是 `opts.servers` 表:

```lua
opts = {
  servers = {
    ["*"] = { ... },     -- 特殊键 "*" :对所有 server 生效的全局配置(快捷键、capabilities)
    lua_ls = { ... },    -- 每个 server 一个键:该 server 的专属配置
    stylua = { enabled = false },  -- 显式禁用某个 server
  },
  setup = { ... },       -- 每个 server 的钩子函数,返回 true 可接管整个启动流程
}
```

你在 `lua/plugins/` 里的配置会和这份默认 `opts` **深度合并**(你的在后,优先生效),所以扩展方式就是在自己的插件文件里覆盖 `servers`。

### 常用配置项说明(`opts.servers.<name>`)

| 配置项 | 说明 |
|---|---|
| `settings` | 传给 LSP 服务器自身的参数(如 lua_ls 的 `settings.Lua.hint`) |
| `capabilities` | 客户端能力声明(告诉服务器"我支持什么"),一般只在 `"*"` 上全局改 |
| `keys` | server 附带的快捷键,LazyVim 合并进 which-key |
| `enabled = false` | 禁用该 server(如默认把 stylua 关了,格式化交给 conform) |
| `mason = false` | **不**让 mason 自动安装这个 server,用你 PATH 上已有的 |
| `root_markers` | 项目根目录识别(靠什么文件定位,如 `package.json`) |
| `cmd` | 启动命令(默认说明书里已写好,可覆盖,比如指向自己装的二进制) |
| `filetypes` | 对哪些文件类型生效(默认说明书里已写好) |
| `init_options` | 初始化请求的额外参数(和 settings 不同,走 initialize 阶段) |
| `on_attach` | 服务器附加到缓冲区时的回调(LazyVim 里一般用 keys 机制替代) |

### 三种手动配置姿势(按侵入度从低到高)

**① 追加/修改某个 server 的参数(最常用)**

```lua
-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {
        settings = { css = { validate = false } },  -- 关掉 css 校验
      },
      lua_ls = {
        settings = { Lua = { diagnostics = { globals = { "vim", "hs" } } } },
      },
    },
  },
}
```

**② 声明一个 LazyVim 默认没有的 server**

```lua
opts = {
  servers = {
    -- 只要 nvim-lspconfig 里有这个 server 的说明书,写个空表即可
    -- mason 会自动安装(mason-lspconfig 联动);mason = false 则用 PATH 上自己装的
    glsl_analyzer = { mason = false },
  },
}
```

**③ 完全接管:自定义 server,LazyVim/nvim-lspconfig 都不管**

```lua
-- 跳过三件套,直接用 Neovim 0.11+ 原生 API(适合极小众 LSP)
return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      my_lsp = function(_, opts)
        vim.lsp.config("my_lsp", {
          cmd = { "/path/to/my-lsp" },
          filetypes = { "mylang" },
          root_markers = { ".git" },
        })
        vim.lsp.enable("my_lsp")
        return true  -- 返回 true:告诉 LazyVim"这个我自己处理了"
      end,
    },
  },
}
```

### 排查 LSP 问题的顺序

1. `:LspInfo` / `:checkhealth lsp` —— 客户端起没起、附加到哪个 buffer
2. `:LspLog` —— 服务器通信日志(参数配错、启动失败都能看到)
3. `:Mason` —— 服务器二进制装没装
4. `which <server命令>` —— 确认二进制在不在 PATH(自己装的场景)

## nvim-lspconfig 的"说明书"是什么

"说明书"是 nvim-lspconfig 仓库里**每个服务器一份的 Lua 配置文件**,告诉 Neovim"这个 LSP 服务器叫什么、怎么启动、对哪些文件生效"。实物在:

```
~/.local/share/nvim/lazy/nvim-lspconfig/lsp/rescriptls.lua
```

以 ReScript 为例,内容大致是:

```lua
---@type vim.lsp.Config
return {
  -- 怎么启动:执行 rescript-language-server 命令,用 stdio 通信
  cmd = { 'rescript-language-server', '--stdio' },

  -- 对哪些文件类型生效:编辑 .res 文件时才启动这个服务器
  filetypes = { 'rescript' },

  -- 怎么找到项目根目录:从当前文件向上找这三个文件,找到的目录就是项目根
  root_markers = { 'bsconfig.json', 'rescript.json', '.git' },

  -- 默认的 server 参数
  settings = {},
  init_options = {
    extensionConfiguration = {
      askToStartBuild = false,        -- 别弹窗问"要不要启动编译"
      allowBuiltInFormatter = true,   -- 用内置格式化器(延迟低)
      incrementalTypechecking = { enable = true, acrossFiles = true },
    },
  },
}
```

### 为什么需要它

LSP 协议只规定了"客户端和服务器怎么对话",但**没规定每个服务器叫什么名字、怎么拉起来**。全世界的 LSP 服务器启动方式五花八门:

| 服务器 | 启动命令 |
|---|---|
| TypeScript | `typescript-language-server --stdio` |
| CSS | `vscode-css-language-server --stdio` |
| Python | `basedpyright-langserver --stdio` |
| ReScript | `rescript-language-server --stdio` |

nvim-lspconfig 就是把这一百多个服务器的"正确启动姿势"收集成一个仓库,不用自己查每个的文档。

### 它在启动链路里的位置

```
你打开 x.res 文件
  ↓
Neovim 查 filetypes:rescript → 谁声明管这个类型?→ rescriptls
  ↓
nvim-lspconfig 读取说明书:cmd = rescript-language-server --stdio
  ↓
在 PATH 上找到这个可执行文件(mason 装的或你 npm 装的都行)
  ↓
从当前目录向上找 bsconfig.json / rescript.json / .git → 确定项目根
  ↓
拉起进程,把 init_options/settings 发给它 → 补全、跳转、报错开始工作
```

### 和"手动配置"的关系

手动配置本质上都是**在说明书基础上打补丁**:

- `opts.servers.rescriptls = { settings = {...} }` —— 批注只覆盖 `settings` 字段,`cmd`、`filetypes` 还是说明书里的
- 只有 `cmd`、`root_markers` 这类字段需要时才自己写("完全接管"姿势等于自己写一份说明书,那是给仓库里根本没有的服务器用的)

类比:nvim-lspconfig 是厂商附带的《安装手册》,你的 `opts.servers.xxx` 是你在手册空白处写的批注——批注优先于手册,但大部分页你还是照着手册来。

## 自定义部分(与 LazyVim 默认的差异)

1. **自动保存**(`lua/config/autocmds.lua`):离开插入模式或文本变化时自动写入文件
2. **关闭拼写检查**(`lua/config/options.lua`):`opt.spell = false`
3. **blink.cmp 纯 Lua fuzzy**(`lua/plugins/blink.lua`):因网络无法下载 GitHub Releases 二进制
4. **前端语言支持**(`lua/plugins/frontend.lua`):HTML / CSS / SCSS / LESS 的 LSP(html-lsp、css-ls、emmet)+ 相关 treesitter parser;TS/React/Tailwind/Flutter 由 extras 提供
5. **lazy.nvim 安装调优**(`lua/config/lazy.lua`):SSH 拉取、浅克隆 `depth=1`、git 超时 600 秒

## 常用快捷键速查(`<leader>` 默认是空格)

| 快捷键 | 功能 |
|---|---|
| `<leader>e` | 开关文件树 |
| `<leader><space>` | 模糊查找文件 |
| `<leader>/` | 全项目搜索文本 |
| `<leader>sg` | grep 搜索(带输入框) |
| `<leader>sr` | 全项目批量替换 |
| `s` | flash 快速跳转 |
| `gcc` / `gc` | 注释/取消注释 |
| `<leader>xx` | 打开诊断列表(trouble) |
| `<leader>st` | 搜索 TODO 注释 |
| `<leader>l` | LSP 相关(定义跳转、引用等也可用 `gd`/`gr`) |
| `<leader>qs` | 恢复上次会话 |
