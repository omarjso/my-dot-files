-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_user_command("Q", "q", {}) -- :Q -> :q
vim.api.nvim_create_user_command("W", "w", {}) -- :W -> :w
vim.api.nvim_create_user_command("WQ", "wq", {}) -- :WQ -> :wq
vim.api.nvim_create_user_command("Wq", "wq", {}) -- :Wq -> :wq

-- Add this to your keymaps.lua or init.lua
vim.keymap.set("n", "q:", "<Nop>", { noremap = true, silent = true })
