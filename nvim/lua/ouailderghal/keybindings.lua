-- [[ Keymaps ]]

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Custom bindings
vim.keymap.set('n', '<leader>gg', '<cmd>:Git<cr>')
vim.keymap.set('n', '<leader>bd', '<cmd>:bdelete<cr>')
vim.keymap.set('n', '<leader>qq', '<cmd>:quit!<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>:Neotree toggle<cr>')

