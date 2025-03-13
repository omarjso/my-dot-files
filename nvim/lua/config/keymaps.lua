-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_user_command("Q", "q", {}) -- :Q -> :q
vim.api.nvim_create_user_command("W", "w", {}) -- :W -> :w
vim.api.nvim_create_user_command("WQ", "wq", {}) -- :WQ -> :wq
vim.api.nvim_create_user_command("Wq", "wq", {}) -- :Wq -> :wq

-- Add this to your keymaps.lua or init.lua
vim.keymap.set("n", "q:", "<Nop>", { noremap = true, silent = true })

-- Create a function in Lua that checks the file under cursor and opens or creates it
local function create_or_open_markdown()
  local target = vim.fn.expand("<cfile>")

  if not string.match(target, "%.md$") then
    print("Not a markdown file")
    return
  end

  -- Expand ~ to full home directory path
  target = vim.fn.expand(target)

  if vim.fn.filereadable(target) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  else
    vim.fn.mkdir(vim.fn.fnamemodify(target, ":h"), "p")
    vim.fn.writefile({}, target)
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  end
end

vim.keymap.set("n", "gm", create_or_open_markdown, {
  noremap = true,
  silent = true,
  desc = "Create/Open markdown", -- so it shows in which-key
})
