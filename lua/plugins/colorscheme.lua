return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = { style = "storm" },
  },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      return {
        style = "dark", -- "auto" | "dark" | "light"
        transparent = false,
        italics = false,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
      }
    end,
  },
}
