-- Per-filetype settings, applied on top of the global options.
--   indent:    number of spaces, or "tabs" for hard tabs (shown 4 wide)
--   textwidth: also sets colorcolumn (default 120)
--   wrap, spell, list: window options
local filetypes = {
  bash       = { indent = 4 },
  c          = { indent = 4 },
  cpp        = { indent = 4 },
  dockerfile = { indent = 4 },
  java       = { indent = 4 },
  php        = { indent = 4 },
  sh         = { indent = 4 },
  python     = { indent = 4, list = true },
  go         = { indent = "tabs", list = true },
  make       = { indent = "tabs", list = true },

  dot        = { indent = 2 },
  json       = { indent = 2 },
  lua        = { indent = 2 },
  nix        = { indent = 2 },
  plantuml   = { indent = 2 },
  tikz       = { indent = 2 },
  yaml       = { indent = 2, list = true },

  bib        = { indent = 2, textwidth = 80, spell = true },
  markdown   = { indent = 2, textwidth = 80, wrap = true, spell = true, list = true },
  tex        = { indent = 2, wrap = true, spell = true },

  diff       = { list = true },
  gitcommit  = { list = true },
}

local function apply(ft)
  if ft.indent == "tabs" then
    vim.bo.expandtab = false
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 0
    vim.bo.shiftwidth = 4
  elseif ft.indent then
    vim.bo.expandtab = true
    vim.bo.tabstop = ft.indent
    vim.bo.softtabstop = ft.indent
    vim.bo.shiftwidth = ft.indent
  end

  if ft.indent then
    local width = ft.textwidth or 120
    vim.bo.textwidth = width
    vim.wo.colorcolumn = tostring(width)
  end

  for _, opt in ipairs({ "wrap", "spell", "list" }) do
    if ft[opt] ~= nil then
      vim.wo[opt] = ft[opt]
    end
  end
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("FiletypeSettings", { clear = true }),
  pattern = vim.tbl_keys(filetypes),
  callback = function(event)
    apply(filetypes[event.match])
  end,
})
