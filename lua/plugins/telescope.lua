return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- add a keymap to browse plugin files
    { "<leader>'", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>*", LazyVim.telescope("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
    { "<leader>*", LazyVim.telescope("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Find Plugin File",
    },
  },
  opts = {
    defaults = {
      -- 文件名优先显示，路径显示在后面
      path_display = {
        "filename_first",
      },
    },
  },
}
