return {
  "navarasu/onedark.nvim",
  cond = true,
  priority = 1000,

  config = function()
    require("onedark").setup({
      style = "light", -- dark, darker, cool, deep, warm, warmer, light
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

      -- Match the kitty light theme background (kitty/themes/light.conf)
      colors = {
        bg0 = "#dcdcdc",
        bg1 = "#d0d0d0",
        bg2 = "#c6c6c6",
        bg3 = "#bcbcbc",
      },

      code_style = {
        comments = "italic",
        keywords = "bold",
        functions = "bold",
        strings = "italic",
        variables = "none",
      },

      diagnostics = {
        darker = false,
        undercurl = true,
        background = true,
      },

      -- Override highlight groups
      highlights = {
        -- Editor chrome
        CursorLine   = { bg = "$bg1" },
        LineNr       = { fg = "$grey" },
        CursorLineNr = { fg = "$yellow", fmt = "bold" },
        MatchParen   = { fg = "$orange", fmt = "bold,underline" },
        Search       = { fg = "$bg0", bg = "$yellow", fmt = "bold" },
        IncSearch    = { fg = "$bg0", bg = "$orange", fmt = "bold" },

        -- Syntax
        ["@keyword"]             = { fg = "$purple", fmt = "bold" },
        ["@keyword.return"]      = { fg = "$red", fmt = "bold" },
        ["@function"]            = { fg = "$blue", fmt = "bold" },
        ["@function.builtin"]    = { fg = "$cyan", fmt = "bold" },
        ["@type"]                = { fg = "$yellow", fmt = "bold" },
        ["@type.builtin"]        = { fg = "$yellow", fmt = "bold,italic" },
        ["@constant"]            = { fg = "$purple", fmt = "bold" },
        ["@constant.builtin"]    = { fg = "$purple", fmt = "bold,italic" },
        ["@string"]              = { fg = "$green", fmt = "italic" },
        ["@comment"]             = { fg = "$grey", fmt = "italic" },
        ["@variable"]            = { fg = "$fg" },
        ["@variable.builtin"]    = { fg = "$red", fmt = "italic" },
        ["@parameter"]           = { fg = "$orange" },
        ["@field"]               = { fg = "$fg" },
        ["@property"]            = { fg = "$fg" },
        ["@operator"]            = { fg = "$cyan" },
        ["@punctuation.bracket"] = { fg = "$fg" },

        -- Diagnostics
        DiagnosticError          = { fg = "$red" },
        DiagnosticWarn           = { fg = "$yellow" },
        DiagnosticInfo           = { fg = "$blue" },
        DiagnosticHint           = { fg = "$green" },
        DiagnosticUnderlineError = { fmt = "undercurl", sp = "$red" },
        DiagnosticUnderlineWarn  = { fmt = "undercurl", sp = "$yellow" },
      },
    })

    vim.o.background = "light"
    vim.cmd("colorscheme onedark")
  end,
}
