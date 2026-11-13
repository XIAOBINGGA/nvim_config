-- blink.cmp 配置（WSL 环境）
-- v2(main 分支)把模糊匹配器拆成了独立插件 saghen/blink.lib，必须一并安装
-- 网络已可访问 GitHub，恢复预编译二进制自动下载（省去本地 cargo 构建）
return {
  {
    "saghen/blink.cmp",
    dependencies = { "saghen/blink.lib" },
    opts = {
      fuzzy = {
        -- 'prefer_rust':优先 Rust 实现,缺失时回退 lua
        implementation = "prefer_rust",
        prebuilt_binaries = {
          download = true,
        },
      },
    },
  },
}
