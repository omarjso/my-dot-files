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
local function edit_or_create_file_under_cursor()
  local target = vim.fn.expand("<cfile>")

  -- If looks like a URL, do something else
  if string.match(target, "^%w+://") then
    -- Example: replicate netrw's `gx` or open in browser
    vim.cmd("normal! gx")
  end

  -- Otherwise treat it like a local file
  if vim.fn.filereadable(target) == 1 then
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  else
    -- Create dirs, empty file, then open
    vim.fn.mkdir(vim.fn.fnamemodify(target, ":h"), "p")
    vim.fn.writefile({}, target)
    vim.cmd("edit " .. vim.fn.fnameescape(target))
  end
end

-- Map `gx` to call edit_or_create_file_under_cursor
-- If you do NOT use which-key, you can do:
-- vim.api.nvim_set_keymap("n", "gx", "<Cmd>lua edit_or_create_file_under_cursor()<CR>", { noremap = true, silent = true })
-- But with which-key in LazyVim, we prefer:
vim.keymap.set("n", "gx", edit_or_create_file_under_cursor, {
  noremap = true,
  silent = true,
  desc = "Open/Create file under cursor with system app", -- so it shows in which-key
})
