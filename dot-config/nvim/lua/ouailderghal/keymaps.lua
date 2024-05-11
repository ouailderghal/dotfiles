-- [[ Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Fugitive bindings
vim.keymap.set('n', '<leader>gg', '<cmd>:Neogit<cr>', { desc = 'Open Git status' })
vim.keymap.set('n', '<leader>gl', '<cmd>:tab Git log<cr>', { desc = 'Open Git log' })
vim.keymap.set('n', '<leader>glo', '<cmd>:tab Git log --oneline<cr>', { desc = 'Open Git log in one line' })
vim.keymap.set('n', '<leader>gp', '<cmd>:tab Git push<cr>', { desc = 'Git push' })

-- Custom keymap
vim.keymap.set('n', '<leader>bd', '<cmd>:bdelete<cr>')
vim.keymap.set('n', '<leader>qq', '<cmd>:quit!<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>:Neotree toggle<cr>')
vim.keymap.set('n', '<C-l>', '<cmd>:bn<cr>')
vim.keymap.set('n', '<C-h>', '<cmd>:bp<cr>')
vim.keymap.set('n', '<leader>zz', '<cmd>:ZenMode<cr>', { desc = 'Toggle Zen mode' })
vim.keymap.set('n', '<leader>ff', '<cmd>:Format<cr>', { desc = '[F]ormat [F]ile'})
