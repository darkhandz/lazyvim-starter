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

-- 用C-g代替ESC
-- 对于命令模式，直接映射为取消命令，避免函数执行
vim.keymap.set("c", "<C-g>", "<C-c>", { desc = "Cancel command" })
-- 对于其他模式，使用函数处理
vim.keymap.set({ "n", "i", "t", "x", "s", "o" }, "<C-g>", function()
  local mode = vim.api.nvim_get_mode().mode

  -- 1. 清除搜索高亮
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
  end

  -- 2. 插件浮窗检测并尝试关闭
  local winid = vim.api.nvim_get_current_win()
  local config = vim.api.nvim_win_get_config(winid)
  if config.relative ~= "" then
    -- 当前是浮窗，尝试关闭
    pcall(vim.api.nvim_win_close, winid, true)
    return
  end

  -- 3. 检查是否有活跃的弹出菜单（补全菜单）
  if vim.fn.pumvisible() == 1 then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-e>", true, false, true), "n", true)
    return
  end

  -- 4. 模式处理
  if mode == "i" then
    -- 插入模式 -> ESC
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  elseif mode == "t" then
    -- 终端模式 -> 退出终端输入
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "t", false)
  elseif mode == "v" or mode == "V" or mode == "\22" then -- \22 是 Ctrl-V (visual block)
    -- 可视模式 -> ESC
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  elseif mode == "s" or mode == "S" or mode == "\19" then -- \19 是 Ctrl-S (select block)
    -- 选择模式 -> ESC
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  elseif mode == "o" then
    -- 操作待定模式 -> ESC
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)
  else
    -- 普通模式或其他模式，清除命令行
    if vim.fn.getcmdline() ~= "" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, false, true), "n", false)
    end
  end
end, { desc = "Universal ESC" })

local map = vim.keymap.set
-- 插入模式 Alt-i：始终插入 Tab
map("i", "<M-i>", "<Tab>", { silent = true, desc = "Insert raw Tab" })
-- 普通模式 Tab：缩进当前行
map("n", "<Tab>", "==", { silent = true, desc = "Indent line" })
-- 可视模式 Tab：缩进选区
map("v", "<Tab>", "=", { silent = true, desc = "Indent selection" })

--[[ Neogit相关
--------------------------------------------------------------------------------
--]]
vim.keymap.set("n", "<leader>ga", function()
  require("utils.git").select_git_author(function(author)
    vim.fn.setreg("+", author)
    require("snacks").notify("Git author copied: " .. author)
  end)
end, { desc = "Select Git Author via fzf-lua" })
