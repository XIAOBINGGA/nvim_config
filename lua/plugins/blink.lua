-- blink.cmp 配置:当前网络无法访问 GitHub Releases,
-- 无法下载 fuzzy 匹配器的预编译二进制,改用纯 Lua 实现
return {
  "saghen/blink.cmp",
  opts = {
    fuzzy = {
      -- 已用本地 cargo(gnu 工具链)编译 Rust 模糊器:
      -- rustup run stable-x86_64-pc-windows-gnu cargo build --release
      -- 产物 blink_cmp_fuzzy.dll 需复制为 libblink_cmp_fuzzy.dll
      -- 'prefer_rust':优先 Rust 实现,缺失时回退 lua
      implementation = "prefer_rust",
      prebuilt_binaries = {
        -- 网络无法访问 GitHub Releases,改为本地构建
        download = false,
      },
    },
  },
}
