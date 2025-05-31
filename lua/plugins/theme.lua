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
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "day" },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,
      color_overrides = {
        latte = {
          base = "#f0f0f0",
        },
      },
      highlight_overrides = {
        -- Increase contrast, which is not enough by default:
        latte = function(colors)
          return {
            CursorLine = { bg = "#e5e5e5" },
            -- Replace some "lavender" fg with "blue":
            ["@variable.member"] = { fg = colors.blue }, -- For fields.
            ["@module"] = { fg = colors.blue }, -- For identifiers referring to modules an…
            ["@property"] = { fg = colors.blue }, -- Same as TSField.
            ["@property.css"] = { fg = colors.blue },
            ["@type.css"] = { fg = colors.blue },
            ["@property.typescript"] = { fg = colors.blue },
            ["@constructor.typescript"] = { fg = colors.blue },
            ["@constructor.tsx"] = { fg = colors.blue },

            -- Replace some "rosewater" fg with "maroon":
            ["@string.special.url"] = { fg = colors.maroon },
            -- Replace cursor color to align with wezterm config:
            TermCursor = { bg = colors.mauve },

            -- Replace some "flamingo" fg with "maroon":
            ["@lsp.type.interface"] = { fg = colors.maroon },
            ["@string.special.symbol"] = { fg = colors.maroon },
            Identifier = { fg = colors.maroon },
            markdownCode = { fg = colors.maroon },
            markdownCodeBlock = { fg = colors.maroon },

            -- Replace some "surface1" and "surface0" bg with "crust"
            Substitute = { bg = colors.crust }, -- used for substitution hints
            Visual = { bg = colors.crust }, -- used for highlighting visual selection
            VisualNOS = { bg = colors.crust }, -- Visual mode selection when vim is "Not Owning the Selection".
            LspReferenceText = { bg = colors.crust }, -- used for highlighting "text" references
            LspReferenceRead = { bg = colors.crust }, -- used for highlighting "read" references
            LspReferenceWrite = { bg = colors.crust }, -- used for highlighting "write" references
            LspSignatureActiveParameter = { bg = colors.crust },
            MatchParen = { bg = colors.crust }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            NeogitDiffContextHighlight = { bg = colors.crust },
            illuminatedWord = { bg = colors.crust },
            illuminatedCurWord = { bg = colors.crust },
            IlluminatedWordText = { bg = colors.crust },
            IlluminatedWordRead = { bg = colors.crust },
            IlluminatedWordWrite = { bg = colors.crust },
            RenderMarkdownCodeInline = { bg = colors.crust },
          }
        end,
      },
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
      colorscheme = "catppuccin-latte",
    },
  },
}
