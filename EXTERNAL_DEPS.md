# 外部程序依赖

Neovim 插件之外,本配置依赖的外部可执行程序及其安装方法(macOS / Homebrew)。
Mason 装的 LSP 属于「Neovim 之外的可执行程序」,一并列出;弱网环境建议用系统包管理器自装(见 FEATURES.md「弱网环境建议」)。

## 一、基础必备(LazyVim 核心体验)

| 程序 | 用途 | 被谁使用 | 安装 |
|---|---|---|---|
| git ≥ 2.19 | 插件拉取(lazy.nvim 用 SSH + 浅克隆)、git 集成 | lazy.nvim、gitsigns、neo-tree | `brew install git`(系统自带一般也够) |
| ripgrep (rg) | 全局内容搜索 | telescope `<leader><space>` / `<leader>/` 等所有 live grep | `brew install ripgrep` |
| fd | 文件名模糊查找(比 find 快) | telescope `<leader><leader>` | `brew install fd` |
| lazygit | 终端内 Git TUI | LazyVim `<leader>gg` | `brew install lazygit` |
| C 编译器 (cc/clang) | 编译 treesitter parser | nvim-treesitter | `xcode-select --install`(macOS 自带即可) |
| curl | mason 下载包、网络请求 | mason.nvim | 系统自带 |
| Nerd Font | 图标显示(终端侧,非程序) | 所有 UI 插件 | `brew install --cask font-jetbrains-mono-nerd-font`,并在终端设置该字体 |

## 二、Node.js 生态(LSP / 前端)

mason 安装的很多 server 依赖 node 运行时:

```sh
brew install node        # 提供 node / npm
```

### Mason 自动安装(见 frontend.lua 的 ensure_installed,打开对应文件自动装)

| Mason 包 | 提供的可执行文件 | 服务 |
|---|---|---|
| typescript-language-server *(lang.typescript extra)* | typescript-language-server、tsserver | ts/js/tsx 的 LSP |
| html-lsp | vscode-html-language-server | HTML LSP |
| css-lsp | vscode-css-language-server | CSS/SCSS/LESS LSP |
| emmet-language-server | emmet-language-server | Emmet 缩写展开 |
| tailwindcss-language-server *(lang.tailwind extra)* | tailwindcss-language-server | Tailwind LSP |
| json-lsp *(lang.json extra)* | vscode-json-language-server | JSON LSP |
| yaml-language-server *(lang.yaml extra)* | yaml-language-server | YAML LSP |

弱网环境替代方案(装完可不依赖 mason):

```sh
npm i -g @vscode/vscode-langservers-extracted   # html + css + json + eslint
npm i -g typescript typescript-language-server
npm i -g @tailwindcss/language-server
npm i -g yaml-language-server
```

### 必须手动 npm 安装(mason registry 没有)

```sh
npm i -g @rescript/language-server   # ReScript LSP(mason = false,见 rescript.lua)
npm i -g rescript                    # 可选:编译器,LSP 增量类型检查不依赖它
```

## 三、格式化 / Lint(LazyVim conform.nvim / nvim-lint 调用)

按需安装,保存对应文件类型时才会用到:

```sh
npm i -g prettier        # js/ts/json/css/html/yaml/markdown 格式化
brew install stylua      # Lua 格式化(本仓库 stylua.toml 对应)
npm i -g eslint_d        # js/ts 快速 lint
brew install shellcheck  # shell lint
```

## 四、Flutter / Dart(见 flutter.lua)

```sh
brew install --cask flutter    # 或从 https://flutter.dev 下载,加入 PATH
flutter doctor                 # 验证环境
```

- dartls 不用单独装:flutter-tools 通过 flutter daemon 自动启动
- 调试需 nvim-dap(LazyVim dart extra 已带),Flutter 侧自动下载 dart-debug-adapter

## 五、Markdown 预览(lang.markdown extra)

```sh
brew install markmap-cli  # <leader>m 打开 markmap 思维导图预览(可选)
```

## 六、ReScript treesitter parser(特殊,需手动编译)

GitHub 直连不通,`TSInstall rescript` 会卡死,手动安装(详见 FEATURES.md「ReScript 环境搭建」):

```sh
git clone --depth 1 https://gh-proxy.com/https://github.com/rescript-lang/tree-sitter-rescript
# 编译 parser(Neovim 自带 cc,无需额外依赖),装到 runtimepath/parser/
```

## 一键检查

```sh
for cmd in git rg fd lazygit node npm curl flutter; do command -v $cmd >/dev/null && echo "✓ $cmd" || echo "✗ $cmd 缺失"; done
```
