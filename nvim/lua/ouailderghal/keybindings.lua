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
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Custom bindings
vim.keymap.set('n', '<leader>bd', '<cmd>:bdelete<cr>')
vim.keymap.set('n', '<leader>qq', '<cmd>:quit!<cr>')
vim.keymap.set('n', '<leader>op', '<cmd>:Neotree toggle<cr>')
vim.keymap.set('n', '<C-n>', '<cmd>:bn<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>:bp<cr>')
vim.keymap.set('n', '<leader>zz', '<cmd>:ZenMode<cr>', { desc = 'Toggle Zen mode' })
vim.keymap.set('n', '<leader>ff', '<cmd>:Format<cr>', { desc = '[F]ormat [F]ile'})
