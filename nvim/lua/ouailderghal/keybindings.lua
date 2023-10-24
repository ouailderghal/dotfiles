-- [[ Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Fugitive bindings
vim.keymap.set('n', '<leader>gg', '<cmd>:tab Git<cr>', { desc = 'Open Git status' })
vim.keymap.set('n', '<leader>gl', '<cmd>:tab Git log<cr>', { desc = 'Open Git log' })
vim.keymap.set('n', '<leader>glo', '<cmd>:tab Git log --oneline<cr>', { desc = 'Open Git log in one line' })
vim.keymap.set('n', '<leader>gp', '<cmd>:tab Git push<cr>', { desc = 'Git push' })

-- Telescope bindings
vim.keymap.set('n', '<leader>po', '<cmd>:Neotree toggle<cr>', { desc = 'Open Project Tree' })
vim.keymap.set('n', '<leader>pf', require('telescope.builtin').git_files, { desc = 'Search [P]roject [F]iles' })

-- Custom bindings
vim.keymap.set('n', '<leader>bd', '<cmd>:bdelete<cr>')
vim.keymap.set('n', '<leader>qq', '<cmd>:quit!<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>:Neotree toggle<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>:bn<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>:bp<cr>')
vim.keymap.set('n', '<leader>zz', '<cmd>:ZenMode<cr>', { desc = 'Toggle Zen mode' })
vim.keymap.set('n', '<leader>ff', '<cmd>:Format<cr>', { desc = '[F]ormat [F]ile'})
