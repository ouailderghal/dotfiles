return {
    {
        "Shatur/neovim-ayShatur/neovim-ayu",
        cond = true,
        priority = 1000,
        config = function()
            vim.o.background = "dark"
            vim.cmd.colorscheme "ayu-dark"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        cond = true,
        opts = {
            options = {
                icons_enabled = true,
                theme = 'ayu-dark',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
}
