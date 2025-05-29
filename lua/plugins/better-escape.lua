return {
  "max397574/better-escape.nvim",
  opts = {
    timeout = vim.o.timeoutlen, -- after `timeout` passes, you can press the escape key and the plugin will ignore it
    default_mappings = true, -- setting this to false removes all the default mappings
    mappings = {
      i = {
        -- disable jj
        j = {
          j = false,
        },
      },
    },
  },
}
