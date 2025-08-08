-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

local opt = {
  noremap = true,
  silent = true,
}

    vim.keymap.set("n", "<leader>b", [[<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<cr>]])
    vim.keymap.set("n", "<leader>e", [[<cmd>lua require('vscode').action('workbench.view.explorer')<cr>]])
    vim.keymap.set("n", "<leader>z", [[<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<cr>]])
    vim.keymap.set("n", "<leader>t", [[<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<cr>]])