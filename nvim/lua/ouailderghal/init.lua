require('ouailderghal.remap')

local opt = vim.opt

opt.timeoutlen = 300

-- fat gui cursor
opt.guicursor = ""

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true

-- current line highlight
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- splits
opt.splitright = true
opt.splitbelow = true

-- dash is not a word separator
opt.iskeyword:append("-")

