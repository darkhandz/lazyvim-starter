return {
  "gbprod/yanky.nvim",
  keys = {
    -- normal 模式使用 yanky 的功能
    { "p", "<Plug>(YankyPutAfter)", mode = "n", desc = "Put yanked text after cursor" },
    { "P", "<Plug>(YankyPutBefore)", mode = "n", desc = "Put yanked text before cursor" },
    -- Visual 模式下使用原生的不影响寄存器的粘贴
    { "p", '"_dP', mode = "x", desc = "<Plug>(YankyPutAfter) without affecting register" },
    { "P", '"_dP', mode = "x", desc = "<Plug>(YankyPutBefore) without affecting register" },
  },
}
