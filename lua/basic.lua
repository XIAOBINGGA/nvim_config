local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboar

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
opt.timeoutlen = 1000