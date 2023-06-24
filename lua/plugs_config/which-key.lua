local status, whickKey = pcall(require, "which-key")

if not status then
    vim.notify("没有找到 which-key")
    return
end

whickKey.setup({})
