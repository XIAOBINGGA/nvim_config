-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for lua files
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--   },
--
--   callback = function()
--     vim.b.autoformat = false
--   end,
-- })

local function save()
  local buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_call(buf, function()
    vim.cmd("silent! write")
  end)
end

vim.api.nvim_create_augroup("AutoSave", {
  clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    save()
  end,
  pattern = "*",
  group = "AutoSave",
})

-- 外部修改文件后自动 reload
vim.api.nvim_create_augroup("AutoRead", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = "AutoRead",
  pattern = "*",
  command = "checktime", -- 检查并读入外部改动(配合 autoread 生效)
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = "AutoRead",
  pattern = "*",
  callback = function(args)
    vim.notify("已重新加载被外部修改的文件: " .. vim.fn.fnamemodify(args.file, ":t"), vim.log.levels.INFO)
  end,
})

-- Python/Go 等语言使用 4 空格缩进
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "go" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})
