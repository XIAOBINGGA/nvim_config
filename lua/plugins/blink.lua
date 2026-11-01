-- blink.cmp 配置:当前网络无法访问 GitHub Releases,
-- 无法下载 fuzzy 匹配器的预编译二进制,改用纯 Lua 实现
return {
  "saghen/blink.cmp",
  opts = {
    fuzzy = {
      -- 'prefer_rust'(默认)→ 改为 'lua',不依赖下载的二进制
      implementation = "lua",
      prebuilt_binaries = {
        download = false,
      },
    },
  },
}
