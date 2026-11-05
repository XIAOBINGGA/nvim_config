-- JSDoc 生成:neogen,光标放在函数/类/方法上按键一键生成注释块
-- 依赖 treesitter parser(javascript/typescript/tsx 已在 frontend.lua 中安装)
return {
  "danymat/neogen",
  opts = {
    -- 启用 jsdoc 对 js/ts/tsx 的支持
    enabled = true,
    languages = {
      javascript = { template = { annotation_convention = "jsdoc" } },
      typescript = { template = { annotation_convention = "jsdoc" } },
      typescriptreact = { template = { annotation_convention = "tsdoc" } },
    },
  },
  keys = {
    {
      "<leader>cn",
      function() require("neogen").generate({}) end,
      desc = "生成 JSDoc 注释",
    },
  },
}
