local tools = require('tools')
return {
    tools.url_replace("ggandor/leap.nvim"),
    config = function()
        local status, leap = pcall(require, "leap")
        if not status then
            vim.notify("没有找到 leap")
            return
        end
        leap.add_default_mappings()
    end
}
