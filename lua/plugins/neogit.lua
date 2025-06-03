return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed.
    -- "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
    -- "echasnovski/mini.pick",         -- optional
    -- "folke/snacks.nvim",             -- optional
  },
  keys = {
    {
      "<leader>gG",
      function()
        local root_dir = require("lazyvim.util").root.get()
        require("neogit").open({ cwd = root_dir })
      end,
      desc = "Neogit(Root dir)",
    },
    {
      "<leader>gg",
      function()
        local current_file_dir = vim.fn.expand("%:p:h")
        if current_file_dir == "" then
          current_file_dir = vim.fn.getcwd()
        end
        require("neogit").open({ cwd = current_file_dir })
      end,
      desc = "Neogit(curr dir)",
    },
  },
}
