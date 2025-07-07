require('basic')
-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


if not vim.g.vscode then
  return {}
end

-- Add some vscode specific keymaps
    -- VSCode-specific keymaps for search and navigation
    vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
    vim.keymap.set("n", "<leader>/", [[<cmd>lua require('vscode').action('workbench.action.findInFiles')<cr>]])
    vim.keymap.set("n", "<leader>ss", [[<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>]])
    vim.keymap.set("n", "<leader>b", [[<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<cr>]])
    vim.keymap.set("n", "<leader>e", [[<cmd>lua require('vscode').action('workbench.view.explorer')<cr>]])

    -- Keep undo/redo lists in sync with VsCode
    vim.keymap.set("n", "u", "<Cmd>call VSCodeNotify('undo')<CR>")
    vim.keymap.set("n", "<C-r>", "<Cmd>call VSCodeNotify('redo')<CR>")

    -- Navigate VSCode tabs like lazyvim buffers
    vim.keymap.set("n", "<S-h>", "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    vim.keymap.set("n", "<S-l>", "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")