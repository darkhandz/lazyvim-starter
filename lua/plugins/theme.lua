return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
  -- Using Lazy
  {
    "navarasu/onedark.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {
      style = "light",
    },
  },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },
  -- 配置 LazyVim 使用 doom-one 作为默认主题
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
