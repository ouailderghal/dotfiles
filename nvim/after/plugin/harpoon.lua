local telescope = require('telescope')
local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- load telescope extension
telescope.load_extension('harpoon')

-- harpoon bindings
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', ui.nav_prev)
vim.keymap.set('n', '<C-l>', ui.nav_next)
