return {
  "ibhagwan/fzf-lua",
  opts = {
    { "hide" },
    fzf_colors = true,
    winopts = {
      height = 0.90,
      width = 0.94,
      fullscreen = true,
      preview = {
        border = "none",
        delay = 200, -- delay(ms) displaying the preview
        layout = "vertical", -- 水平布局
        horizontal = "right:50%", -- 右侧50%
        vertical = "down:65%", -- vertical模式的配置（备用）
        flip_columns = 120, -- 当列数小于120时翻转到vertical
        winopts = { -- builtin previewer window options
          cursorline = true,
          cursorlineopt = "both",
          cursorcolumn = true,
          signcolumn = "no",
        },
      },
    },
    grep = {
      actions = {
        -- actions inherit from 'actions.files' and merge
        -- this action toggles between 'grep' and 'live_grep'
        --删除默认的快捷键另外绑定一个,因为我有其他功能要绑这个组合键
        ["alt-l"] = { require("fzf-lua").actions.grep_lgrep },
        ["ctrl-g"] = false,
      },
    },
  },
}
