-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.lazyvim_picker = "fzf"
vim.g.snacks_animate = false

if vim.g.neovide then
  vim.opt.title = true
  vim.opt.titlestring = vim.fs.basename(vim.fn.getcwd())
  vim.opt.guifont = "Maple Mono NF CN SemiBold:h13"
  vim.g.neovide_scale_factor = 1.0
  -- vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
  -- vim.g.neovide_scroll_animation_length = 0.3
  -- vim.g.neovide_scroll_animation_far_lines = 1
end

-- 获取当前的 root_spec。如果还没有定义，则初始化一个空表。
local current_root_spec = vim.g.root_spec or {}
-- 插入 .projectile 规则到最前面，确保它拥有最高优先级。
table.insert(current_root_spec, 1, { ".projectile" })
-- 更新全局的 root_spec
vim.g.root_spec = current_root_spec
