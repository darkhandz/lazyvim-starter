-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 命令模式C-v智能粘贴, 优先使用系统剪贴板，如果为空则使用默认寄存器
vim.keymap.set("c", "<C-v>", function()
  local system_clip = vim.fn.getreg("+")
  return system_clip ~= "" and system_clip or vim.fn.getreg('"')
end, { expr = true, desc = "Smart paste (system clipboard or default register)" })

-- 快速搜索
vim.keymap.set({ "n", "x" }, "<leader>'", "<cmd>FzfLua resume<cr>", { desc = "Resume" })
vim.keymap.set({ "n" }, "<leader>*", LazyVim.pick("grep_cword"), { desc = "Word (Root Dir)" })
vim.keymap.set({ "x" }, "<leader>*", LazyVim.pick("grep_visual"), { desc = "Selection (Root Dir)" })

-- \ 按键搜索当前buffer，选中的话就搜索选中的字符串，没选中就自动选光标下的单词
vim.keymap.set({ "x" }, "\\", function()
  local utils = require("fzf-lua.utils")
  require("fzf-lua").grep_curbuf({ search = utils.get_visual_selection() })
end, { desc = "Grep current buffer with selection" })
vim.keymap.set({ "n" }, "\\", function()
  local utils = require("fzf-lua.utils")
  require("fzf-lua").grep_curbuf({
    no_esc = true,
    search = [[\b]] .. utils.rg_escape(vim.fn.expand("<cword>")) .. [[\b]],
  })
end, { desc = "Grep current buffer with cursor word" })

-- emacs编辑模式
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move cursor right" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move cursor left" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Move to end of line" })
vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-d>", "<Del>", { desc = "Delete character" })

-- Cmd-s用来保存(MacOS)
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

vim.keymap.set("v", "<Tab>", "=", { silent = true, desc = "Indent selection" })

--[[ Neogit相关
--------------------------------------------------------------------------------
--]]
vim.keymap.set("n", "<leader>ga", function()
  require("utils.git").select_git_author(function(author)
    vim.fn.setreg("+", author)
    require("snacks").notify("Git author copied: " .. author)
  end)
end, { desc = "Select Git Author via fzf-lua" })
