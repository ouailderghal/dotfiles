return {
  "navarasu/onedark.nvim",
  cond = true,
  priority = 1000,

  config = function()
    -- Variant loaded at startup: "dark" or "light"
    local default_variant = "dark"

    local variants = {
      dark = {
        style = "dark", -- dark, darker, cool, deep, warm, warmer
        colors = {},
      },
      light = {
        style = "light",
        -- Match the kitty light theme background (kitty/themes/light.conf)
        colors = {
          bg0 = "#dcdcdc",
          bg1 = "#d0d0d0",
          bg2 = "#c6c6c6",
          bg3 = "#bcbcbc",
        },
      },
    }

    local onedark = require("onedark")

    onedark.setup({
      transparent = false,
      term_colors = true,
      ending_tildes = false,
      cmp_itemkind_reverse = false,

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

        -- Diagnostics
        DiagnosticError          = { fg = "$red" },
        DiagnosticWarn           = { fg = "$yellow" },
        DiagnosticInfo           = { fg = "$blue" },
        DiagnosticHint           = { fg = "$green" },
        DiagnosticUnderlineError = { fmt = "undercurl", sp = "$red" },
        DiagnosticUnderlineWarn  = { fmt = "undercurl", sp = "$yellow" },
      },
    })

    -- Apply a variant. set_options replaces the colors table, whereas setup()
    -- would merge it with the previous variant's overrides.
    local function apply(variant)
      onedark.set_options("style", variants[variant].style)
      onedark.set_options("colors", variants[variant].colors)
      vim.o.background = variant
      vim.cmd.colorscheme("onedark")
    end

    local function toggle_variant()
      apply(vim.o.background == "dark" and "light" or "dark")
    end

    vim.keymap.set("n", "<leader>tb", toggle_variant, { desc = "Toggle light/dark theme" })
    vim.keymap.set("n", "<F10>", toggle_variant, { desc = "Toggle light/dark theme" })

    apply(default_variant)
  end,
}
