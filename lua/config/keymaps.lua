-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<leader>'", "<cmd>FzfLua resume<cr>", { desc = "Resume", noremap = true })
vim.keymap.set({ "n" }, "<leader>*", LazyVim.pick("grep_cword"), { desc = "Word (Root Dir)", noremap = true })
vim.keymap.set({ "v" }, "<leader>*", LazyVim.pick("grep_visual"), { desc = "Selection (Root Dir)", noremap = true })
