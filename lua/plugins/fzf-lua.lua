return {
  "ibhagwan/fzf-lua",
  opts = function(_, opts)
    opts[1] = { "hide" }
    opts.winopts.fullscreen = true
    opts.winopts.preview = {
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
    }
  end,
}
