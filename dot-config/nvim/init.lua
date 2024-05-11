require("ouailderghal.lib")
require("ouailderghal.options")

init_lazy('/lazy/lazy.nvim')
require('lazy').setup({ { import = 'ouailderghal.plugins' } })

set_theme('onedark')

require("ouailderghal.config") require("ouailderghal.keymaps")

vim.cmd('autocmd FileType make setlocal tabstop=2')
vim.cmd('autocmd FileType make setlocal shiftwidth=2')
vim.cmd('autocmd FileType make setlocal expandtab')
