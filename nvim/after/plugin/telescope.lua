local builtin = require('telescope.builtin')

-- Find buffer
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- Find file in a directory
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Find file in a Git repo
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

