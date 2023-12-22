-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = {
  noremap = true,
  silent = true
}
-- 本地变量
local map = vim.api.nvim_set_keymap

map("i", "jj", "<Esc>", opt)
-- ; : 互换
map("n", ";", ":", opt)
map("n", ":", ";", opt)

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)
-- map("n", "qq", ":q!<CR>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)
------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
-- map("n", "s", "", opt)
-- map("n", "sv", ":vsp<CR>", opt)
-- map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
-- map("n", "sc", "<C-w>c", opt)
-- 关闭其他
-- map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- map("n", "s,", ":vertical resize -10<CR>", opt)
-- map("n", "s.", ":vertical resize +10<CR>", opt)
-- 上下比例
-- map("n", "sj", ":resize +10<CR>", opt)
-- map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
local PlugsKey = {}
-- nvim-cmp 自动补全快捷键
PlugsKey.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  return {
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<A-,>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    -- ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    -- ["<C-j>"] = cmp.mapping.select_next_item(),
    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    -- end of super Tab
    -- 确认
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" })
  }
end
-- telescope
-- map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<leader>tf", ":Telescope find_files<CR>", opt)
-- map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
map("n", "<leader>tg", ":Telescope live_grep<CR>", opt)
map("n", "<leader>tp", ":Telescope project<CR>", opt)
map("n", "<leader>tb", ":Telescope file_browser<CR>", opt)
-- Telescope 列表中 插入模式快捷键
PlugsKey.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<C-n>"] = "move_selection_next",
    ["<C-p>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    -- ["<esc>"] = actions.close,
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down"
  }
}
-- lsp
-- rename
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
-- 格式化数据
map("n", "<leader>f", "<cmd>Format<CR>", opt)
-- code_actions
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
-- go xx
map("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
-- gh
map("n", "<leader>gh", "<cmd>Lspsaga hover_doc<CR>", opt)
-- gr
map("n", "<leader>gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
-- diagnostic
map("n", "<leader>gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
map("n", "<leader>gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
map("n", "<leader>gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
PlugsKey.mapLSP = function(mapbuf)
  -- vim.notify("load lsp key map")
end
-- nvim-tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("n", "<leader>m", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>ff", ":NvimTreeFindFileToggle<CR>", opt)
return PlugsKey
