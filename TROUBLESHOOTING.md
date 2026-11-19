# WSL 环境 nvim 故障排查记录

记录 WSL 中 nvim (LazyVim) 遇到的问题与修复过程，供后续参考。
修复日期：2026-11-06

---

## 1. fzf-lua 报错 `transform($FZF_SELECT_COUNT -eq 0 ...)`

**原因**：系统 apt 源（Ubuntu 24.04 noble）里的 fzf 锁定在 `0.44.1`，太旧。
fzf-lua 使用的 `transform` action 需要 fzf ≥ 0.53。Ubuntu 稳定源只修 bug 不升版本，apt 无法升级。

**修复**：安装 Linux 原生新版二进制到 `~/.local/bin`（不依赖 apt，也不走 Windows interop）：

```bash
# 用浏览器下载 fzf Linux 版压缩包后解压安装
tar -xzf ~/Downloads/fzf-0.74.5-linux_amd64.tar.gz -C ~/.local/bin
sudo apt remove -y fzf   # 可选：移除旧版 /usr/bin/fzf，避免混淆
```

**注意**：不要用 Windows 侧 scoop/npm 的 fzf.exe，interop 调用有明显延迟。
apt 仓库的 fzf 无法升级到 0.53+，不要指望 `apt upgrade`。

---

## 2. nvim-treesitter 报 "Unmet requirements: C compiler"

**原因**：nvim-treesitter main 分支编译 parser 需要 C 编译器，WSL 里没有。

**修复**：

```bash
sudo apt update && sudo apt install -y build-essential   # gcc/make
```

---

## 3. treesitter parser 安装报 `spawn .../tree-sitter ENOENT`

**原因**：WSL 的 PATH 里 Windows 侧 npm 装的 tree-sitter-cli（只有 `tree-sitter.exe`）
排在前面，nvim-treesitter 调它必然失败；且 Windows 版 CLI 也编译不出 Linux 的 `parser.so`。

**修复**：安装 Linux 原生 tree-sitter CLI 到 `~/.local/bin`（PATH 优先级最高，自动覆盖）：

```bash
# 浏览器下载 https://github.com/tree-sitter/tree-sitter/releases 的
# tree-sitter-cli-linux-x64.zip（新版命名是 zip 不是 .gz），解压后：
python3 -c "import zipfile; zipfile.ZipFile('tree-sitter-cli-linux-x64.zip').extractall('/tmp/ts')"
cp /tmp/ts/tree-sitter ~/.local/bin/ && chmod +x ~/.local/bin/tree-sitter
```

**验证**：`bash -lc 'which tree-sitter'` 应指向 `~/.local/bin/tree-sitter`。
装好后 parser 全部编译成功（30 个 .so 在 `~/.local/share/nvim/site/parser/`）。

**注意**：`npm install -g tree-sitter-cli` 在 WSL 里装出来依赖 postinstall 从 GitHub
下载二进制，网络不稳时同样会失败；且必须用 WSL 内的 node（`~/apps/node`），
不能用 Windows 侧 npm。WSL 直连 GitHub 超时时，开代理"允许局域网连接"或浏览器下载。

---

## 4. blink.cmp 报 `no field package.preload 'blink.lib'` / `module 'blink.lib' not found`

**原因**：blink.cmp **v2（main 分支）把模糊匹配器拆成了独立插件 `saghen/blink.lib`**，
必须显式声明为依赖。旧配置是 Windows 时代写的：禁用了预编译二进制下载
（`prebuilt_binaries.download = false`），注释里写的是 Windows dll 构建方案。

**修复**：重写 `~/.config/nvim/lua/plugins/blink.lua`：

```lua
-- blink.cmp v2(main 分支)必须依赖 saghen/blink.lib
-- 网络已可访问 GitHub，恢复预编译二进制自动下载
return {
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.lib" },
    opts = {
      fuzzy = {
        implementation = "prefer_rust", -- 缺二进制时自动回退纯 Lua
        prebuilt_binaries = { download = true },
      },
    },
  },
}
```

然后重启 nvim 让 lazy.nvim 自动安装 `blink.lib`（或 `:Lazy install blink.lib` +
`:Lazy restore`）。

---

## 环境备忘

- 环境：WSL2 (Ubuntu 24.04 noble)，nvim 配置在 `~/.config/nvim`（LazyVim）
- Linux 原生 node 在 `~/apps/node`（v24），优先于 Windows 侧 npm
- 以下工具装在 `~/.local/bin`（PATH 优先）：fzf 0.74.5、tree-sitter 0.27.1
- 外部依赖全齐：git/rg/fd/fzf/lazygit/delta/bat/eza/unzip/gcc/make/python3/curl/tar
- WSL 直连 GitHub 时通时不通；下载大文件优先：开代理 Allow LAN → 浏览器下载
- 项目代码放 WSL ext4（如 `~/projects`），勿放 `/mnt/c`（9p 文件 I/O 极慢）
- Mason 包（10 个）：vtsls、tailwindcss-ls、emmet-language-server、html/css/json/yaml-ls、
  markdownlint-cli2、markdown-toc、shfmt（此前 5 个装失败的已补齐）
